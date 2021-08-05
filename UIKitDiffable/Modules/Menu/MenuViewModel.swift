//
//  MenuViewModel.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import Foundation

protocol MenuViewModelDelegate: AnyObject {
    // Specify callback methods for view controller here...
}

class MenuViewModel {

    // MARK: - Types

    enum SectionIdentifier {
        case basic
    }

    enum Item {
        case tableView
        case collectionView
    }

    struct Section {
        var identifier: SectionIdentifier
        var items: [Item]
    }

    // MARK: - Dependencies
    
    weak var delegate: MenuViewModelDelegate?
    private let flowController: MenuFlowProtocol

    // MARK: - Properties
    
    let sections: [Section] = [
        Section(identifier: .basic, items: [
            .tableView,
            .collectionView
        ])
    ]

    // MARK: - Initializers
    
    init(flowController: MenuFlowProtocol) {
        self.flowController = flowController
    }
    
    // MARK: - Actions
    
    func selected(item: Item) {
        switch item {
        case .tableView:
            self.flowController.showTableView()
        case .collectionView:
            self.flowController.showCollectionView()
        }
    }
}
