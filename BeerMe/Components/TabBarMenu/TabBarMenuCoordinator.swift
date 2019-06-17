//
//  TabCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/29/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

class TabCoordinator: BRCoordinator<BRTabBarController> {
    
    // MARK: - Properties
    
    private let breweryManager: BreweryManager
    private let locationManager: LocationManager
    private let dataStore: DataStore
    
    // MARK: Initialization
    
    init(rootViewController: BRTabBarController, breweryManager: BreweryManager, locationManager: LocationManager, dataStore: DataStore) {
        self.breweryManager = breweryManager
        self.locationManager = locationManager
        self.dataStore = dataStore
        
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let mapRootViewController = BRNavigationController()
        let mapCoordinator = MapCoordinator(breweryManager: breweryManager, locationManager: locationManager, rootViewController: mapRootViewController)
        mapCoordinator.start()
        mapRootViewController.tabBarItem = UITabBarItem(title: LocalizableStrings.createEntryTitle.localized, image: UIImage(named: "pin"), selectedImage: nil)
        
        let journalRootViewController = BRNavigationController()
        let journalCoordinator = JournalCoordinator(dataStore: dataStore, rootViewController: journalRootViewController)
        journalCoordinator.start()
        journalRootViewController.tabBarItem = UITabBarItem(title: LocalizableStrings.journalTitle.localized, image: UIImage(named: "note"), selectedImage: nil)
        
        rootViewController?.viewControllers = [mapRootViewController, journalRootViewController]
    }
}
