//
//  BRTabBarCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/29/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

class BRCoordinator<T: UIViewController> {
    var childCoordinators: [BRCoordinator] = []
    weak var rootViewController: T?
    
    init(rootViewController: T) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        fatalError("start() is abstract and should be implemented by subclasses")
    }
}
