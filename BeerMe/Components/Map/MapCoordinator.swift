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

class MapCoordinator: BRCoordinator {
    
    // MARK: - Properties
    
    private let locationsManager: LocationsManager
    
    // MARK: - Initialization
    
    init(locationsManager: LocationsManager, rootViewController: UINavigationController) {
        self.locationsManager = locationsManager
        
        super.init(rootViewController: rootViewController)
    }

    override func start() {
        let viewModel = MapViewModel(locationsManager: locationsManager, coordinator: self)
        let viewController = MapViewController(viewModel: viewModel)
        
        rootViewController?.pushViewController(viewController, animated: true)
    }
}

extension MapCoordinator: MapCoordinatorProtocol {
    
}
