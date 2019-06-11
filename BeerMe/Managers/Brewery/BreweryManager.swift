//
//  LocationsManager.swift
//  BeerMe
//
//  Created by Ian Koller on 5/21/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation

class BreweryManager {
    
    // MARK: - Properties
    
    private let services: LocationServices
    var breweries: [Brewery]?
    
    // MARK: - Initialization
    
    init(services: LocationServices) {
        self.services = services
    }
    
    func getLocationsFor(lat: Double, long: Double, completion: @escaping (BreweryResponse?, Error?) -> Void) {
        services.getLocationsFor(latitude: lat, longitude: long, completion: completion)
    }
}
