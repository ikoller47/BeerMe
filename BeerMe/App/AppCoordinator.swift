//
//  AppCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/14/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BRCoordinator<UIViewController> {
    
    // MARK: Properties
    
    private let window: UIWindow
    private let breweryManager: BreweryManager
    private let locationManager: LocationManager
    private let dataStore: DataStore
    
    // MARK: Initialization
    
    init(appEnvironment: AppEnvironment, window: UIWindow) {
        self.window = window
        self.breweryManager = appEnvironment.breweryManager
        self.locationManager = appEnvironment.locationManager
        self.dataStore = appEnvironment.dataStore
        
        let rootViewController = UIViewController()

        super.init(rootViewController: rootViewController)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    override func start() {
        let tabMenuRootViewController = BRTabBarController()
        
        let tabMenuCoordinator = TabCoordinator(rootViewController: tabMenuRootViewController, breweryManager: breweryManager, locationManager: locationManager, dataStore: dataStore)
        tabMenuCoordinator.start()
        
        rootViewController?.addChildToView(tabMenuRootViewController)
    }
}
