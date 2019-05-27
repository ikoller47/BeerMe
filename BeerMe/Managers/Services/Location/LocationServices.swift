//
//  BeerMappingServices.swift
//  BeerMe
//
//  Created by Ian Koller on 5/16/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Alamofire

class LocationServices: BRServices {
    
    // MARK: - Properties
    
    private let baseURL: String
    
    // MARK: - Initialization
    
    init(baseURL: String) {
        self.baseURL = baseURL
        
        let decoder = JSONDecoder()
        let sessionManager = SessionManager()

        super.init(sessionManager: sessionManager, decoder: decoder)
    }
    
    func getLocationsFor(city: String, completion: @escaping ([Location]?, Error?) -> Void) {
        let params = ["by_city": city]
        
        let request = BRRequest(baseURL: baseURL, path: "breweries", method: .get, params: params)
        
        start(request: request, completion: completion)
    }
}
