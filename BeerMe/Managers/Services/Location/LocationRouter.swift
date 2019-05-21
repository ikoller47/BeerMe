//
//  LocationRouter.swift
//  BeerMe
//
//  Created by Ian Koller on 5/20/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Alamofire

enum LocationRouter: BRRouter {
    case getLocationsForCity(String)
    
    var baseURL: String {
        return "http://beermapping.com/webservice/"
    }
    
    var apiKey: String {
        return "629cb39d0060a5a1e1c160871ada30dd"
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLocationsForCity:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getLocationsForCity(let city):
            return "\(apiKey)/loccity/\(city)"
        }
    }
}
