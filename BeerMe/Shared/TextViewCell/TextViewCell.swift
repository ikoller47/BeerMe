//
//  PlaceholderCell.swift
//  BeerMe
//
//  Created by Ian Koller on 2/7/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import UIKit

class TextViewCell: GroupedCell, UITextViewDelegate, Sizable {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: - Properties
    
    private var placeholder: String?
    private var viewModel: TextCellViewModelProtocol?
    
    // MARK: - Configuration
    
    func configure(withModel model: TextCellViewModelProtocol) {
        placeholder = model.placeholder
        
        textView.text = model.value ?? model.placeholder
        textView.textColor = model.value != nil ? .black : .placeholderGray
        
        textView.delegate = self
        viewModel = model
    }
    
    // MARK: - UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let currentText: String = textView.text
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            
            textView.text = placeholder
            textView.textColor = UIColor.placeholderGray
            
            textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
        }
        else if textView.textColor == UIColor.placeholderGray && !text.isEmpty {
            textView.textColor = UIColor.black
            textView.text = text
        }
        else {
            viewModel?.updated(withText: updatedText)
            return true
        }
        
        viewModel?.updated(withText: text)
        return false
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        if self.contentView.window != nil {
            if textView.textColor == UIColor.placeholderGray {
                textView.selectedTextRange = textView.textRange(from: textView.beginningOfDocument, to: textView.beginningOfDocument)
            }
        }
    }
    
    // MARK: - Sizing
    
    override var intrinsicContentSize: CGSize {
        return CGSize(
            width: UIView.noIntrinsicMetric,
            height: min(textView.contentSize.height + 2 * 10, 76)
        )
    }
}
