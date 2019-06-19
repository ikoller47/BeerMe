//
//  AppEnvironment.swift
//  BeerMe
//
//  Created by Ian Koller on 5/16/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

class AppEnvironment {
    
    // MARK: - Properties
    
    let services: LocationServices
    let breweryManager: BreweryManager
    let locationManager: LocationManager
    let dataStore: DataStore
    
    // MARK: - Initialization
    
    init(appSettings: AppSettings) {
        self.services = LocationServices(baseURL: appSettings.servicesURL, apiKey: appSettings.servicesAPIKey)
        self.breweryManager = BreweryManager(services: services)
        self.locationManager = LocationManager()
        self.dataStore = DataStore()
    }
}
