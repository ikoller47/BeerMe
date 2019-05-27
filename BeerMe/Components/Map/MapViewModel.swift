//
//  MapViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation

protocol MapViewModelProtocol {
    
}

class MapViewModel: MapViewModelProtocol {
    
    // MARK: - Properties
    
    private let locationsManager: LocationsManager
    private let coordinator: MapCoordinatorProtocol
    private var locations: [MapLocationViewModel]?
    
    // MARK: Initialization
    
    init(locationsManager: LocationsManager, coordinator: MapCoordinatorProtocol) {
        self.locationsManager = locationsManager
        self.coordinator = coordinator
        
        getLocations()
    }
    
    func getLocations() {
        locationsManager.getLocationsFor(city: "Chicago"){ locations, error in
            guard let locations = locations else {
                return
            }
            
//            self.locations = locations.map ({ (location) -> MapLocationViewModel in
//                MapLocationViewModel(model: location, coordinator: self.coordinator)
//            })
        }
    }
}
