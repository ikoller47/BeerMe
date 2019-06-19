//
//  AppDelegate.swift
//  BeerMe
//
//  Created by Ian Koller on 5/12/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        #if DEBUG
        let appSettings = AppSettings.staging
        #else
        let appSettings = AppSettings.production
        #endif
        
        let appEnvironment = AppEnvironment(appSettings: appSettings)
        let appCoordinator = AppCoordinator(appEnvironment: appEnvironment, window: window)
        
        appCoordinator.start()
        
        return true
    }
}

