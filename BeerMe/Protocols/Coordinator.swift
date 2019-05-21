//
//  Coordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/14/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var rootViewController: UINavigationController { get }
    
    func start()
}
