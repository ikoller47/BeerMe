//
//  EntryViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 6/1/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

protocol EntryViewModelProtocol: BRViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var rating: String { get }
}

class EntryViewModel: BRViewModel, EntryViewModelProtocol {
    
    // MARK: - Properties
    
    let title: String
    let description: String
    let rating: String
    
    // MARK: - Initialization
    
    init(title: String, description: String, rating: Int) {
        self.title = title
        self.description = description
        self.rating = String(rating)
    }
}
