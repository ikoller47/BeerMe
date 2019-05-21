//
//  MapViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

protocol MapViewModelProtocol {
    
}

class MapViewModel: MapViewModelProtocol {
    
    // MARK: - Properties
    
    private let services: LocationServices
    private let coordinator: MapViewModelDelegate
    
    // MARK: Initialization
    
    init(services: LocationServices, coordinator: MapViewModelDelegate) {
        self.services = services
        self.coordinator = coordinator
    }
}
