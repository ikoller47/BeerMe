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
    
    init(appSettings: AppSettings) {
        self.services = LocationServices()
    }
}
