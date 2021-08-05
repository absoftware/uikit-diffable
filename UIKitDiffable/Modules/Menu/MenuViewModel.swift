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
    // Specify callback methods for view controller.
}

class MenuViewModel {

    // MARK: - Types

    enum Item {
        case tableView
        case collectionView
    }

    // MARK: - Dependencies
    
    weak var delegate: MenuViewModelDelegate?
    private let flowController: MenuFlowControllerProtocol

    // MARK: - Properties
    
    // Properties here...
    
    // MARK: - Initializers
    
    init(flowController: MenuFlowControllerProtocol) {
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
