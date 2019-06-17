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
        _ = viewModel.displayEntries.observeNext {
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

// MARK: - UICollectionViewDataSource
extension JournalViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.displayEntries.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: EntryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(withModel: viewModel.displayEntries.value[indexPath.row])
        
        cell.isFirstInSection = indexPath.row == 0
        cell.isLastInSection = indexPath.row == viewModel.displayEntries.value.count - 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return GroupedHeaderSection.size(forCollectionView: collectionView, withModel: viewModel.entriesHeader)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableView(ofKind: kind, forIndexPath: indexPath) as GroupedHeaderSection
            headerView.configure(withModel: viewModel.entriesHeader)

            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension JournalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let model = viewModel.displayEntries.value[indexPath.item]
        return EntryCell.size(forCollectionView: collectionView, withModel: model)
    }
}
