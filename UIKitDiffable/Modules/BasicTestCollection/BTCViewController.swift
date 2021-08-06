//
//  BTCViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

class BTCViewController: UIViewController, UICollectionViewDelegateFlowLayout, BTCViewModelDelegate {

    // MARK: - Subviews

    var collectionView: UICollectionView!

    // MARK: - Dependencies
    
    var viewModel: BTCViewModel!

    // MARK: - Properties

    private lazy var data = BTCCollectionViewData(viewModel: self.viewModel).createData(useCacheFrom: nil)

    private lazy var dataSource = BTCCollectionViewDataSource(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in

        let item = self.data.item(identifier: itemIdentifier)!
        let cell = collectionView.dequeue(cell: BTCItemCell.self, indexPath: indexPath)
        self.update(cell: cell, indexPath: indexPath, item: item)
        return cell
    }

    private lazy var supplementaryViewProvider: BTCCollectionViewDataSource.SupplementaryViewProvider = { collectionView, elementKind, indexPath in

        guard elementKind == UICollectionView.elementKindSectionHeader else {
            return nil
        }

        let header = collectionView.dequeue(header: CollectionViewSectionHeader.self, indexPath: indexPath)
        switch self.dataSource.sectionIdentifier(for: indexPath.section)! {
        case .testReload:
            header.titleLabel.text = "Reload"

        case .testReloadWithAnimation:
            header.titleLabel.text = "Reload + animation"

        case .testReconfigure:
            header.titleLabel.text = "Reconfigure"

        case .testReconfigureWithAnimation:
            header.titleLabel.text = "Reconfigure + animation"
        }

        return header
    }

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // View
        self.view.backgroundColor = .white

        // Collection view layout
        let layout = UICollectionViewFlowLayout()

        // Collection view
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).autoLayout
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.allowsSelection = true
        self.collectionView.alwaysBounceVertical = true
        self.view.addSubview(self.collectionView) {
            $0.fill()
        }

        // Register cells
        self.collectionView.register(cell: BTCItemCell.self)
        self.collectionView.register(header: CollectionViewSectionHeader.self)

        // Set supplementary view provider
        self.dataSource.supplementaryViewProvider = self.supplementaryViewProvider

        // Apply data
        self.dataSource.apply(self.data.diffableSnapshot)
    }

    // MARK: - BTCViewController methods
    
    private func update(cell: BTCItemCell, indexPath: IndexPath, item: BTCCollectionViewData.Item, animated: Bool = false) {

        // Label
        if animated {
            UIView.transition(with: cell.titleLabel, duration: 0.3, options: [.transitionFlipFromLeft, .curveEaseInOut]) {
                cell.titleLabel.text = "Clicked: \(item.numberOfClicks)"
            } completion: { animationCompleted in

            }
        } else {
            cell.titleLabel.text = "Clicked: \(item.numberOfClicks)"
        }

        // Switcher
        cell.switcher.isOn = item.isSwitchOn
        cell.switcher.removeTarget(self, action: nil, for: .allEvents)
        cell.switcher.tag = indexPath.integerValue
        cell.switcher.addTarget(self, action: #selector(switcherValueChanged(_:)), for: .valueChanged)
    }

    /// Reload without animation. Selection of the cell is not displayed at all as side effect.
    private func reload(indexPath: IndexPath) {
        let item = BTCCollectionViewData(viewModel: self.viewModel).createItem(from: indexPath)
        self.data.reload(items: [item])
        self.dataSource.apply(self.data.diffableSnapshot, animatingDifferences: false) {
            // TODO: Do we need to do sth here in animation completion handler?
        }
    }

    /// Reload with animation. Animation is related to entire cell using some transition between states.
    /// So we don't have animations for specific subviews but for entire cell.
    private func reloadWithAnimation(indexPath: IndexPath) {
        let item = BTCCollectionViewData(viewModel: self.viewModel).createItem(from: indexPath)
        self.data.reload(items: [item])
        self.dataSource.apply(self.data.diffableSnapshot, animatingDifferences: true) {
            // TODO: Do we need to do sth here in animation completion handler?
        }
    }

    /// Update without reloading. Without animation. It works as expected with animation for
    /// disappearing selection but label and switch are immediately updated.
    private func reconfigure(indexPath: IndexPath) {
        let item = BTCCollectionViewData(viewModel: self.viewModel).createItem(from: indexPath)
        self.data.update(items: [item])
        if let cell = self.collectionView.cellForItem(at: indexPath) as? BTCItemCell {
            self.update(cell: cell, indexPath: indexPath, item: item)
        }
    }

    /// Update without reloading. With animation. It works as expected with animation for
    /// disappearing selection. Label is animated nicely.
    private func reconfigureWithAnimation(indexPath: IndexPath) {
        let item = BTCCollectionViewData(viewModel: self.viewModel).createItem(from: indexPath)
        self.data.update(items: [item])
        if let cell = self.collectionView.cellForItem(at: indexPath) as? BTCItemCell {
            self.update(cell: cell, indexPath: indexPath, item: item, animated: true)
        }
    }

    // MARK: - UICollectionViewDelegate methods

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        self.viewModel.selected(indexPath: indexPath)
    }

    // MARK: - UICollectionViewDelegateFlowLayout methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: BTCItemCell.defaultHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 0.0,
            left: 0.0,
            bottom: 10.0,
            right: 0.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: CollectionViewSectionHeader.defaultHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(
            width: collectionView.frame.size.width,
            height: 0.0)
    }

    // MARK: - BTCViewModelDelegate methods
    
    func viewModel(_ viewModel: BTCViewModel, updatedItemAt indexPath: IndexPath) {
        // We show here that reloading of cells bring worse effects than manual reconfiguration of cells.
        let section = viewModel.sections[indexPath.section]
        switch section.identifier {
        case .reload:
            self.reload(indexPath: indexPath)
        case .reloadWithAnimation:
            self.reloadWithAnimation(indexPath: indexPath)
        case .reconfigure:
            self.reconfigure(indexPath: indexPath)
        case .reconfigureWithAnimation:
            self.reconfigureWithAnimation(indexPath: indexPath)
        }
    }

    // MARK: - Actions

    @objc func switcherValueChanged(_ switcher: UISwitch) {
        let indexPath = IndexPath(integerValue: switcher.tag)
        self.viewModel.set(isOn: switcher.isOn, at: indexPath)
    }
}
