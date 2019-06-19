//
//  UICollectionView+Utils.swift
//  BeerMe
//
//  Created by Ian Koller on 6/2/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    // MARK: - Registration
    
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(_: T.Type, kind: String) {
        register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(ofKind kind: String, forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue view with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return view
    }
}
