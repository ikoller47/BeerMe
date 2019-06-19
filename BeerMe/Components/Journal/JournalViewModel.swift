//
//  JournalViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 5/30/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Bond

protocol JournalViewModelProtocol {
    var title: String { get }
    var entriesHeader: String { get }
    var displayEntries: Observable<[EntryViewModelProtocol]>{ get }
    
    func addButtonPressed()
}

class JournalViewModel: JournalViewModelProtocol {
    
    // MARK: - Properties
    
    private let dataStore: DataStore
    private let coordinator: JournalCoordinatorProtocol
    
    let title: String
    let entriesHeader: String
    let displayEntries = Observable<[EntryViewModelProtocol]>([])
    
    // MARK: Initialization
    
    init(dataStore: DataStore, coordinator: JournalCoordinatorProtocol) {
        self.coordinator = coordinator
        self.dataStore = dataStore
                
        title = BeerMeStrings.journalTitle.localized
        entriesHeader = BeerMeStrings.entries.localized
        
        loadEntries()
    }
    
    func loadEntries() {
        let journalEntries: [JournalEntry]? = dataStore.read(key: "entries")
        
        guard let entries = journalEntries else {
            return
        }
        
        displayEntries.value = entries.map {
            EntryViewModel(title: $0.title, description: $0.details, rating: $0.rating)
        }
    }
    
    func addButtonPressed() {
        coordinator.addButtonPressed()
    }
}

// MARK: - JournalCreateViewModelDelegate
extension JournalViewModel: JournalCreateViewModelDelegate {
    func entryCreated() {
        loadEntries()
    }
}
