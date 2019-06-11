//
//  LocationManager.swift
//  BeerMe
//
//  Created by Ian Koller on 5/28/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    // MARK: - Properties
    
    private let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation?
    
    // MARK: - Initialization
    
    override init() {
        super.init()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        currentLocation = location
        
        NotificationCenter.default.post(name: .didUpdateLocation, object: self)
    }
}
