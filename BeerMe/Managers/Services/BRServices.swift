//
//  BRServices.swift
//  BeerMe
//
//  Created by Ian Koller on 5/13/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Alamofire

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class EGServices {
    
    // MARK: - Properties
    
    private let sessionManager: SessionManager
    let decoder: JSONDecoder
    
    // MARK: Initialization
    
    init(sessionManager: SessionManager, decoder: JSONDecoder) {
        self.sessionManager = sessionManager
        self.decoder = decoder
    }
    
    // MARK: - Networking Requests
    
    func start<T: Codable>(request: URLRequest, completion: @escaping ([T]?, Error?) -> Void) {
        sessionManager.request(request).validate().responseData { response in
            DispatchQueue.main.async {
                guard let data = response.result.value else {
                    return
                }
                
                var model: [T]? = nil
                
                do {
                    model = try self.decoder.decode([T].self, from: data)
                    completion(model, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
        }
    }
    
    func start(request: URLRequest, completion: @escaping (Error?) -> Void) {
        sessionManager.request(request).validate().responseData { response in
            DispatchQueue.main.async {
                switch response.result {
                case .success:
                    completion(nil)
                case .failure(let error):
                    completion(error)
                }
            }
        }
    }
    
    func start<T: Codable>(request: URLRequest, completion: @escaping (T?, Error?) -> Void) {
        print("URL: \(request.url)")
        sessionManager.request(request).validate().responseData { response in
            DispatchQueue.main.async {
                print("Status: \(response.response?.statusCode)")
                guard let data = response.result.value else {
                    return
                }
                let string = String(data: data, encoding: .utf8)
                print("Response: \(string)")
                
                var model: T? = nil
                
                do {
                    model = try self.decoder.decode(T.self, from: data)
                    completion(model, nil)
                } catch {
                    completion(nil, error)
                }
            }
            
        }
    }
}
