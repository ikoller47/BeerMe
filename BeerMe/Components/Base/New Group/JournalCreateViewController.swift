//
//  JournalCreateViewController.swift
//  BeerMe
//
//  Created by Ian Koller on 6/6/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class JournalCreateViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    enum Section: Int, CaseIterable {
        case title
        case details
    }
    
    private var viewModel: JournalCreateViewModelProtocol
    private var submitButton: UIBarButtonItem!
    
    // MARK: - Initialization
    
    required init(viewModel: JournalCreateViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        
        bindViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("You must use `init(viewModel:)")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        collectionView.register(TextViewCell.self)
        collectionView.register(TextFieldCell.self)
        collectionView.register(GroupedHeaderSection.self, kind: UICollectionView.elementKindSectionHeader)
                
        submitButton = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(submitPressed))
//        submitButton.isEnabled = false
        navigationItem.rightBarButtonItem = submitButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        observeKeyboardNotifications(shouldObserve: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        observeKeyboardNotifications(shouldObserve: false)
    }
    
    // MARK: - Bindings
    
    func bindViewModel() {
        
    }
    
    // MARK: - Actions
    
    @objc private func submitPressed() {
        viewModel.submitPressed()
    }
}

// MARK: - UICollectionViewDataSource
extension JournalCreateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let row = Section(rawValue: indexPath.row) else { fatalError() }
        
        switch row {
        case .title:
            let cell: TextFieldCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            
            cell.configure(withModel: viewModel.entryRows[indexPath.row])
            
            cell.isFirstInSection = indexPath.row == 0
            cell.isLastInSection = indexPath.row == viewModel.entryRows.count - 1
            
            return cell
        case .details:
            let cell: TextViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            
            cell.configure(withModel: viewModel.entryRows[indexPath.row])
            
            cell.isFirstInSection = indexPath.row == 0
            cell.isLastInSection = indexPath.row == viewModel.entryRows.count - 1
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate
extension JournalCreateViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableView(ofKind: kind, forIndexPath: indexPath) as GroupedHeaderSection
            headerView.configure(withModel: viewModel.createHeader)
            
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard collectionView.numberOfItems(inSection: section) != 0, let section = Section(rawValue: section) else {
            return .zero
        }
        
        switch section {
        case .title:
            return GroupedHeaderSection.size(inCollectionView: collectionView, withModel: viewModel.createHeader)
        case.details:
            return .zero
        }
    }
}
    
// MARK: - UICollectionViewDelegateFlowLayout
extension JournalCreateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let row = Section(rawValue: indexPath.item) else { return .zero }
        
        let model = viewModel.entryRows[indexPath.row]
        
        switch row {
        case .title:
            return TextFieldCell.size(inCollectionView: collectionView, withModel: model)
        case .details:
            return TextViewCell.size(inCollectionView: collectionView, withModel: model)
        }
    }
}
