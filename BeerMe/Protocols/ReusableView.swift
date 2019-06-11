//
//  ReusableView.swift
//  BeerMe
//
//  Created by Ian Koller on 6/2/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView {
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension UICollectionReusableView: ReusableView {}
