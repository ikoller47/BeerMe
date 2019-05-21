//
//  BRRouter.swift
//  BeerMe
//
//  Created by Ian Koller on 5/20/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Alamofire

protocol BRRouter: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var baseURL: String { get }
}

extension BRRouter {
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.appending(self.path).asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue
        
        return urlRequest
    }
}
