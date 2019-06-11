//
//  BRNavigationController.swift
//  BeerMe
//
//  Created by Ian Koller on 5/30/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class BRNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = .navigationBar
        self.navigationBar.tintColor = .navigationBarText
        
        let font = UIFont.boldSystemFont(ofSize: 20.0)
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.navigationBarText, .font: font]
    }
}
