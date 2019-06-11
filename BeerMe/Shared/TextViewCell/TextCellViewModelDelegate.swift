//
//  FeedbackCellDelegate.swift
//  BeerMe
//
//  Created by Ian Koller on 2/5/19.
//  Copyright © 2019 Sapphire Mobile. All rights reserved.
//

import Foundation

protocol TextCellViewModelDelegate {
    func updated(viewModel: TextCellViewModelProtocol, withText text: String)
}
