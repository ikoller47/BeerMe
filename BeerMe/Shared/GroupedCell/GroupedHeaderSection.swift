//
//  MoreHeaderSection.swift
//  BeerMe
//
//  Created by Ian Koller on 1/30/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import UIKit

class GroupedHeaderSection: UICollectionReusableView, Sizable {

    // MARK: - Outlets
    
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - Properties
    
    private var viewModel: String?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = nil
    }
    
    // MARK: - Configuration
    
    func configure(withModel model: String?) {
        label.text = model?.uppercased()
    }
    
    // MARK: - Sizing
    
    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: label.bounds.height + 28
        )
    }
}
