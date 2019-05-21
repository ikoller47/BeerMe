//
//  MapCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/15/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol MapViewModelDelegate {
    
}

class MapCoordinator: BRCoordinator {
    
    // MARK: - Properties
    
    let services: LocationServices
    
    // MARK: - Initialization
    
    init(services: LocationServices, rootViewController: UINavigationController) {
        self.services = services
        
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        let viewModel = MapViewModel(services: services, coordinator: self)
        let viewController = MapViewController(viewModel: viewModel)
        
        rootViewController?.pushViewController(viewController, animated: true)
    }
}

extension MapCoordinator: MapViewModelDelegate {
    
}
