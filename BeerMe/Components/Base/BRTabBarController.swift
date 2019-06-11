//
//  BRTabBarController.swift
//  BeerMe
//
//  Created by Ian Koller on 5/31/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class BRTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .navigationBarText
        tabBar.barTintColor = .navigationBar
        tabBar.isTranslucent = false
    }
}
