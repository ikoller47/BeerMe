//
//  MapCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/15/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol MapCoordinatorProtocol {
    
}

protocol LocationCoordinatorProtocol {
    
}

class MapCoordinator: BRCoordinator<BRNavigationController> {
    
    // MARK: - Properties
    
    private let breweryManager: BreweryManager
    private let locationManager: LocationManager
    
    // MARK: - Initialization
    
    init(breweryManager: BreweryManager, locationManager: LocationManager, rootViewController: BRNavigationController) {
        self.breweryManager = breweryManager
        self.locationManager = locationManager
        
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        let viewModel = MapViewModel(breweryManager: breweryManager, locationManager: locationManager, coordinator: self)
        let viewController = MapViewController(viewModel: viewModel)
        
        rootViewController?.pushViewController(viewController, animated: true)
    }
}

extension MapCoordinator: MapCoordinatorProtocol {
    
}

extension MapCoordinator: LocationCoordinatorProtocol {
    
}
