//
//  LocationsManager.swift
//  BeerMe
//
//  Created by Ian Koller on 5/21/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation

class LocationsManager {
    
    // MARK: - Properties
    
    private let services: LocationServices
    var locations: [Location]?
    
    // MARK: - Initialization
    
    init(services: LocationServices) {
        self.services = services
        
        
    }
    
    func getLocationsFor(city: String, completion: @escaping ([Location]?, Error?) -> Void) {
        services.getLocationsFor(city: city, completion: completion)
    }
    
//    func getLatLongFromAddress(location: Location) -> CLLocation? {
//        let addressString = "\(location.street), \(location.city), \(location.state) \(location.zip)"
//
//        let geoCoder = CLGeocoder()
//        var geoLocation: CLLocation?
//
//        geoCoder.geocodeAddressString(addressString) { (placemarks, error) in
//            guard let placemarks = placemarks, let location = placemarks.first?.location else {
//                return
//            }
//
//            geoLocation = location
//        }
//
//        return geoLocation
//    }
}
