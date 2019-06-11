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
    static var nibName: String { get }
}

extension NibLoadable where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self)
    }
    
    static func viewFromNib() -> Self {
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: Self.nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: nil, options: nil)[0] as! Self
    }
}

extension UICollectionReusableView: NibLoadable {}
