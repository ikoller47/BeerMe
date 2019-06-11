//
//  GroupedCell.swift
//  BeerMe
//
//  Created by Ian Koller on 2/10/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import UIKit

class GroupedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var isLastInSection: Bool = false {
        didSet {
            bottomSeparatorViewConstraint.constant = isLastInSection ? 0 : 14
        }
    }
    
    var isFirstInSection: Bool = false {
        didSet {
            topSeparatorView.isHidden = !isFirstInSection
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? .selectedCellColor : .white
        }
    }
    
    private var topSeparatorView = UIView()
    private var bottomSeparatorViewConstraint = NSLayoutConstraint()
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        
        topSeparatorView = UIView(frame: .zero)
        let bottomSeparatorView = UIView(frame: .zero)
        
        topSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        bottomSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(topSeparatorView)
        contentView.addSubview(bottomSeparatorView)
        
        topSeparatorView.backgroundColor = .cellDividerColor
        topSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        topSeparatorView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topSeparatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        bottomSeparatorView.backgroundColor = .cellDividerColor
        bottomSeparatorViewConstraint = bottomSeparatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        bottomSeparatorViewConstraint.isActive = true
        bottomSeparatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bottomSeparatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
    }
}

