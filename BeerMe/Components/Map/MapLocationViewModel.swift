//
//  MapLocationViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/22/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import CoreLocation

class MapLocationViewModel {
    
    // MARK: - Properties
    
    private let model: Location
    private let coordinator: MapCoordinatorProtocol
    
    var id: Int {
        return model.id
    }
    
    var name: String {
        return model.name
    }
    
    var breweryType: String {
        return model.breweryType
    }
    
    var address: String {
        return "\(model.street), \(model.city), \(model.state) \(model.zip)"
    }
    var phoneNumber: String {
        return model.phoneNumber
    }
    
    var website: String {
        return model.website
    }
    
    // MARK: - Initialization
    
    init(model: Location, coordinator: MapCoordinatorProtocol) {
        self.model = model
        self.coordinator = coordinator
    }
}
