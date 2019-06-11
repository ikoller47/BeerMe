//
//  MapLocationViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/22/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import MapKit

class LocationViewModel: NSObject {
    
    // MARK: - Properties
    
    private let model: Brewery
    private let coordinator: MapCoordinatorProtocol
    
    var name: String {
        return model.name
    }
    
    var address1: String {
        return "\(model.location.address1)"
    }
    
    var cityStateZip: String {
        return "\(model.location.city), \(model.location.state) \(model.location.zipCode)"
    }
    
    var phone: String {
        return model.phone
    }
    
    var url: URL {
        return model.url
    }
    
    var latitude: Double {
        return model.coordinates.latitude
    }
    
    var longitude: Double {
        return model.coordinates.longitude
    }
    
    var image: UIImage {
        return UIImage(named: "beer.pdf")!
    }
    
    // MARK: - Initialization
    
    init(model: Brewery, coordinator: MapCoordinatorProtocol) {
        self.model = model
        self.coordinator = coordinator
    }
}

// MARK: - MKAnnotation
extension LocationViewModel: MKAnnotation {
    var title: String? {
        return name
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
