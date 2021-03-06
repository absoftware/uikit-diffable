//
//  MenuViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit
import LayoutExtension

class MenuViewController: UIViewController, UITableViewDelegate, MenuViewModelDelegate {

    // MARK: - Subviews

    let tableView = UITableView(frame: .zero, style: .grouped).autoLayout

    // MARK: - Dependencies
    
    var viewModel: MenuViewModel!

    // MARK: - Properties

    private lazy var data = MenuTableViewData(viewModel: self.viewModel).createData(useCacheFrom: nil)

    private lazy var dataSource = MenuTableViewDataSource(tableView: self.tableView) { tableView, indexPath, itemIdentifier in
        let item = self.data.item(identifier: itemIdentifier)!
        let cell = tableView.dequeue(cell: TableViewCell.self, indexPath: indexPath)
        self.update(cell: cell, indexPath: indexPath, item: item)
        return cell
    }

	// MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        self.view.backgroundColor = .white
        
        // Table view
        self.tableView.allowsSelection = true
        self.tableView.delegate = self
        self.view.addSubview(self.tableView) {
            $0.fill()
        }

        // Register cells
        self.tableView.register(cell: TableViewCell.self)

        // Apply snapshot
        self.dataSource.apply(self.data.diffableSnapshot)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.deselectMenuItem(animated)
    }

    // MARK: - MenuViewController methods

    private func deselectMenuItem(_ animated: Bool) {
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    private func update(cell: TableViewCell, indexPath: IndexPath, item: MenuTableViewData.Item) {
        cell.accessoryType = .disclosureIndicator
        switch item.identifier {
        case .basicTableView:
            cell.textLabel?.text = "Test UITableView"
        case .basicCollectionView:
            cell.textLabel?.text = "Test UICollectionView"
        }
    }

    // MARK: - UITableViewDelegate methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemIdentifier = self.dataSource.itemIdentifier(for: indexPath)!
        switch itemIdentifier {
        case .basicTableView:
            self.viewModel.selected(item: .tableView)
        case .basicCollectionView:
            self.viewModel.selected(item: .collectionView)
        }
    }

    // MARK: - MenuViewModelDelegate methods
    
    // Delegate methods here...

    // MARK: - Actions

    // UI actions here...
}
