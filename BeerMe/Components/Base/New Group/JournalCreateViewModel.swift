//
//  JournalCreateViewModel.swift
//  BeerMe
//
//  Created by Ian Koller on 6/6/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation

protocol JournalCreateViewModelProtocol: TextCellCoordinatorProtocol {
    var title: String { get }
    var createHeader: String { get }
    var entryRows: [TextCellViewModelProtocol] { get }
    
    func submitPressed()
}

protocol JournalCreateViewModelDelegate {
    func entryCreated()
}

enum CreateEntrySection: Int, CaseIterable {
    case title
    case detail
}

class JournalCreateViewModel: JournalCreateViewModelProtocol, TextCellViewModelDelegate {
    
    // MARK: - Properties
    
    let title: String
    let createHeader: String
    let dataStore: DataStore
    let entryKey = "entries"
    let coordinator: JournalCreateCoordinatorProtocol
    let delegate: JournalCreateViewModelDelegate
    var entryRows = [TextCellViewModelProtocol]()
    
    private var entryTitle = ""
    private var entryDetails = ""
    
    // MARK: - Initialization
    
    init(dataStore: DataStore, delegate: JournalCreateViewModelDelegate, coordinator: JournalCreateCoordinatorProtocol) {
        title = "Create Entry"
        createHeader = "New Entry"
        
        self.coordinator = coordinator
        self.dataStore = dataStore
        self.delegate = delegate
        
        let emailRow = TextCellViewModel(placeholder: "What was the beer called?", delegate: self, coordinator: coordinator)
        let feedbackRow = TextCellViewModel(placeholder: "What makes this a tasty brew? Write the details here.", delegate: self, coordinator: coordinator)
        
        entryRows = [emailRow, feedbackRow]
    }
    
    func submitPressed() {
        let newEntry = JournalEntry(title: entryTitle, details: entryDetails)
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
}
