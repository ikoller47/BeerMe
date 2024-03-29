//
//  NibLoadable.swift
//  BeerMe
//
//  Created by Ian Koller on 6/2/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

extension NibLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}

extension UICollectionReusableView: NibLoadable {}
