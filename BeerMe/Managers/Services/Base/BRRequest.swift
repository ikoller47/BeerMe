//
//  BRRequest.swift
//  BeerMe
//
//  Created by Ian Koller on 5/23/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Alamofire

class BRRequest {
    
    // MARK: - Properties
    
    private let baseURL: String
    private let path: String
    private let method: HTTPMethod
    private let params: [String: Any]?
    
    // MARK: - Initialization
    
    init(baseURL: String, path: String, method: HTTPMethod, params: [String: Any]?) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.params = params
    }
}

// MARK: - URLRequestConvertible
extension BRRequest: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        var request = try URLRequest(url: "\(baseURL)\(path)", method: method)
        
        guard let params = params else {
            return request
        }
        
        if method == .get {
            request = try Alamofire.URLEncoding.default.encode(request, with: params)
        } else if method == .post {
            request = try Alamofire.JSONEncoding.default.encode(request, with: params)
        }
        
        return request
    }
}
