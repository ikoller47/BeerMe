//
//  JournalCreateViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 6/6/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import Bond

protocol JournalCreateViewModelProtocol: TextCellCoordinatorProtocol {
    var title: String { get }
    var createHeader: String { get }
    var entryRows: [TextCellViewModelProtocol] { get }
    var rating: Observable<Int> { get }
    
    func update(rating: Int)
    func submitPressed()
}

protocol JournalCreateViewModelDelegate {
    func entryCreated()
}

enum CreateEntrySection: Int, CaseIterable {
    case title
    case detail
}

class JournalCreateViewModel: BRViewModel, JournalCreateViewModelProtocol, TextCellViewModelDelegate {
    
    // MARK: - Properties
    
    let title: String
    let createHeader: String
    let dataStore: DataStore
    let entryKey = "entries"
    let coordinator: JournalCreateCoordinatorProtocol
    let delegate: JournalCreateViewModelDelegate
    let rating = Observable<Int>(5)
    var entryRows = [TextCellViewModelProtocol]()
    
    private var entryTitle = ""
    private var entryDetails = ""
    
    // MARK: - Initialization
    
    init(dataStore: DataStore, delegate: JournalCreateViewModelDelegate, coordinator: JournalCreateCoordinatorProtocol) {
        title = LocalizableStrings.createEntryTitle.localized
        createHeader = LocalizableStrings.newEntry.localized
        
        self.coordinator = coordinator
        self.dataStore = dataStore
        self.delegate = delegate
        
        super.init()
        
        let emailRow = TextCellViewModel(placeholder: LocalizableStrings.entryTitlePlaceholder.localized, delegate: self, coordinator: coordinator)
        let feedbackRow = TextCellViewModel(placeholder: LocalizableStrings.entryDetailsPlaceholder.localized, delegate: self, coordinator: coordinator)
        
        entryRows = [emailRow, feedbackRow]
    }
    
    func submitPressed() {
        let newEntry = JournalEntry(title: entryTitle, details: entryDetails, rating: rating.value)
        let journalEntries: [JournalEntry]? = dataStore.read(key: entryKey)

        if var entries = journalEntries {
            entries.append(newEntry)
            dataStore.write(model: entries, forKey: entryKey)
        } else {
            let entries = [newEntry]
            dataStore.write(model: entries, forKey: entryKey)
        }
        
        delegate.entryCreated()
        coordinator.dismissCreateEntry()
    }
    
    func updated(viewModel: TextCellViewModelProtocol, withText text: String) {
        if viewModel === entryRows[CreateEntrySection.title.rawValue] {
            entryTitle = text
        } else {
            entryDetails = text
        }
    }
    
    func update(rating: Int) {
        self.rating.value = rating
    }
}
