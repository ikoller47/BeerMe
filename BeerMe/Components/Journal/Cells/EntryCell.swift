//
//  EntryCell.swift
//  BeerMe
//
//  Created by Ian Koller on 6/2/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class EntryCell: GroupedCell, ResizableView {

    // MARK: - Outlets
    
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var beerDescription: UILabel!
    @IBOutlet private weak var rating: UILabel!
    
    // MARK: - Properties
    
    private var viewModel: EntryViewModelProtocol?
    
    // MARK: - Configuration
    
    func configure(withModel model: EntryViewModelProtocol) {
        viewModel = model
        
        title.text = model.title
        beerDescription.text = model.description
        rating.text = model.rating
    }
    
    // MARK: - Sizing
    
    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: beerDescription.frame.maxY + 10
        )
    }
}
