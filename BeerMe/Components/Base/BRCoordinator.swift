//
//  BRCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/14/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

class BRCoordinator {
    var childCoordinators: [BRCoordinator] = []
    weak var rootViewController: UINavigationController?
    
    init(rootViewController: UINavigationController?) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        fatalError("`start()` is abstract and should be implemented by subclases")
    }
}
