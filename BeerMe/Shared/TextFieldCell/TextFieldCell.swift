//
//  TextFieldCell.swift
//  BeerMe
//
//  Created by Ian Koller on 2/13/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import UIKit

class TextFieldCell: GroupedCell, UITextFieldDelegate, ResizableView {

    // MARK: - IBOutlets
    
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: - Properties
    
    private var viewModel: TextCellViewModelProtocol?
    
    // MARK: - Configuration
    
    func configure(withModel model: TextCellViewModelProtocol) {
        viewModel = model

        textField.text = model.value
        textField.placeholder = model.placeholder
        textField.delegate = self
    }
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            viewModel?.updated(withText: updatedString)
        }

        return true
    }
    
    // MARK: - Sizing
    
    static var staticSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: 50
        )
    }
}
