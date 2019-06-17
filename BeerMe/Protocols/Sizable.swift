//
//  Sizable2.swift
//  BeerMe
//
//  Created by Ian Koller on 6/3/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol ResizableView: NibLoadable {
    associatedtype Model
    
    func configure(withModel model: Model)
    
    static var staticSize: CGSize { get }
}

extension ResizableView where Self: UIView {
    
    static var staticSize: CGSize {
        return .zero
    }
    
    static func size(forCollectionView collectionView: UICollectionView, withModel model: Model) -> CGSize {
        var size: CGSize
        
        if staticSize == .zero {
            let sizingCell = viewFromNib()
        
            sizingCell.frame.size = collectionView.frame.size
        
            sizingCell.configure(withModel: model)
        
            sizingCell.setNeedsUpdateConstraints()
            sizingCell.setNeedsLayout()
            sizingCell.layoutIfNeeded()
        
            size = sizingCell.intrinsicContentSize
        } else {
            size = staticSize
        }
    
        if size.width == UIView.noIntrinsicMetric {
            size.width = collectionView.frame.width
        }
        
        if size.height == UIView.noIntrinsicMetric {
            size.height = collectionView.frame.height
        }

        return size
    }
}
