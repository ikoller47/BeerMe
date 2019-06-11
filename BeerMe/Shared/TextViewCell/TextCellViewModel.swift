//
//  PlaceholderCellViewModelProtocol.swift
//  BeerMe
//
//  Created by Ian Koller on 2/7/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import Foundation

protocol TextCellViewModelProtocol: class {
    var value: String? { get }
    var placeholder: String { get }    
    func updated(withText text: String)
}

class TextCellViewModel: TextCellViewModelProtocol {
    
    // MARK: - Properties
    
    var value: String? = nil
    let placeholder: String
    var delegate: TextCellViewModelDelegate?
    
    // MARK: - Initialization
    
    init(placeholder: String, delegate: TextCellViewModelDelegate, coordinator: TextCellCoordinatorProtocol) {
        self.placeholder = placeholder
        self.delegate = delegate
    }
    
    func updated(withText text: String) {
        value = text
        delegate?.updated(viewModel: self, withText: text)
    }
}

