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
    private let services: LocationServices
    
    // MARK: Initialization
    
    init(appEnvironment: AppEnvironment, window: UIWindow) {
        self.window = window
        self.services = appEnvironment.services
        
        let rootViewController = UINavigationController()

        super.init(rootViewController: rootViewController)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let mapCoordinator = MapCoordinator(services: services, rootViewController: rootViewController!)
        mapCoordinator.start()
    }
}
