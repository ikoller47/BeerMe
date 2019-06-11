//
//  EntryViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 6/1/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

protocol EntryViewModelProtocol {
    var title: String { get }
    var description: String { get }
    var rating: String { get }
}

class EntryViewModel: EntryViewModelProtocol {
    let title: String
    let description: String
    let rating: String
    
    init(title: String, description: String, rating: String) {
        self.title = title
        self.description = description
        self.rating = rating
    }
}
