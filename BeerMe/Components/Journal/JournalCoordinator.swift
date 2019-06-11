//
//  JournalCoordinator.swift
//  BeerMe
//
//  Created by Ian Koller on 5/30/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import Foundation
import UIKit

protocol JournalCoordinatorProtocol {
    func addButtonPressed()
}

class JournalCoordinator: BRCoordinator<BRNavigationController> {
    
    // MARK: - Properties
    
    private let dataStore: DataStore
    private var journalCreateViewModelDelegate: JournalCreateViewModelDelegate?
    
    // MARK: Initialization
    
    init(dataStore: DataStore, rootViewController: BRNavigationController) {
        self.dataStore = dataStore

        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let viewModel = JournalViewModel(dataStore: dataStore, coordinator: self)
        journalCreateViewModelDelegate = viewModel
        
        let viewController = JournalViewController(viewModel: viewModel)
        rootViewController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - JournalCoordinatorProtocol
extension JournalCoordinator: JournalCoordinatorProtocol {
    func addButtonPressed() {
        let viewModel = JournalCreateViewModel(dataStore: dataStore, delegate: journalCreateViewModelDelegate!, coordinator: self)
        let viewController = JournalCreateViewController(viewModel: viewModel)
        rootViewController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - JournalCreateCoordinatorProtocol
extension JournalCoordinator: JournalCreateCoordinatorProtocol {
    func dismissCreateEntry() {
        rootViewController?.popViewController(animated: true)
    }
}
