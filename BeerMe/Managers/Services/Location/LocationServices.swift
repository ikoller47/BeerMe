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
    
    init() {
        let decoder = JSONDecoder()
        let sessionManager = SessionManager()

        super.init(sessionManager: sessionManager, decoder: decoder)
    }
    
    func getLocationsFor(city: String, completion: @escaping ([Location]?, Error?) -> Void) {
        start(request: LocationRouter.getLocationsForCity(city), completion: completion)
    }
}
