//
//  JournalViewController.swift
//  BeerMe
//
//  Created by Ian Koller on 5/30/19.
//  Copyright © 2019 Sapphire. All rights reserved.
//

import UIKit

class JournalViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var emptyStateView: UIView!
    @IBOutlet private weak var emptyStateImageView: UIImageView!
    
    // MARK: - Properties
    
    private enum Section: Int, CaseIterable {
        case entries
    }
    
    private let viewModel: JournalViewModelProtocol
    
    // MARK: - Initialization
    
    required init(viewModel: JournalViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        preconditionFailure("You must use `init(viewModel:)")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()

        title = viewModel.title
        
        collectionView.register(EntryCell.self)
        collectionView.register(GroupedHeaderSection.self, kind: UICollectionView.elementKindSectionHeader)
        collectionView.register(GroupedFooterSection.self, kind: UICollectionView.elementKindSectionFooter)
        
        emptyStateImageView.tintColor = .lightGray
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: - Binding
    
    func bindViewModel() {
        viewModel.displayEntries.observeNext {
            if $0.count > 0 {
                self.emptyStateView.isHidden = true
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Actions
    
     @objc private func addButtonPressed(_ sender: UIBarButtonItem) {
        viewModel.addButtonPressed()
    }
}

extension JournalViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { fatalError() }
        
        switch section {
        case .entries:
            return viewModel.displayEntries.value.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .entries:
            let cell: EntryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.configure(withModel: viewModel.displayEntries.value[indexPath.row])
            
            cell.isFirstInSection = indexPath.row == 0
            cell.isLastInSection = indexPath.row == viewModel.displayEntries.value.count - 1
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard collectionView.numberOfItems(inSection: section) != 0, let section = Section(rawValue: section) else {
            return .zero
        }
        
        switch section {
        case .entries:
            return GroupedHeaderSection.size(inCollectionView: collectionView, withModel: viewModel.entriesHeader)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableView(ofKind: kind, forIndexPath: indexPath) as GroupedHeaderSection
            headerView.configure(withModel: viewModel.entriesHeader)

            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
}

extension JournalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = Section(rawValue: indexPath.section) else { return .zero }
        
        switch section {
        case .entries:
            let model = viewModel.displayEntries.value[indexPath.item]
            return EntryCell.size(inCollectionView: collectionView, withModel: model)
        }
    }
}
