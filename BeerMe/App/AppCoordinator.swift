//
//  AppCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/14/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BRCoordinator {
    
    // MARK: Properties
    
    private let window: UIWindow
    private let locationsManager: LocationsManager
    
    // MARK: Initialization
    
    init(appEnvironment: AppEnvironment, window: UIWindow) {
        self.window = window
        self.locationsManager = appEnvironment.locationsManager
        
        let rootViewController = UINavigationController()

        super.init(rootViewController: rootViewController)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let mapCoordinator = MapCoordinator(locationsManager: locationsManager, rootViewController: rootViewController!)
        mapCoordinator.start()
    }
}
