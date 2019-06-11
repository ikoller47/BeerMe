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
    private let apiKey: String
    
    // MARK: - Initialization
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        
        let decoder = JSONDecoder()
        let session = Session()

        super.init(session: session, decoder: decoder)
    }
    
    // MARK: - Networking Requests
    
    func getLocationsFor(latitude: Double, longitude: Double, completion: @escaping (BreweryResponse?, Error?) -> Void) {
        let params = [
            "latitude": latitude,
            "longitude": longitude,
            "categories": "breweries"
            ] as [String : Any]
        
        let request = BRRequest(baseURL: baseURL, apiKey: apiKey, path: "businesses/search", method: .get, params: params)
        
        start(request: request, completion: completion)
    }
}
