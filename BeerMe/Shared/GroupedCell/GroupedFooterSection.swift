//
//  GroupedFooterSection.swift
//  BeerMe
//
//  Created by Alex Koller on 3/10/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import UIKit

class GroupedFooterSection: UICollectionReusableView, ResizableView {
    
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
        label.text = model
    }
    
    // MARK: - Sizing
    
    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: label.bounds.height + 28
        )
    }
}
