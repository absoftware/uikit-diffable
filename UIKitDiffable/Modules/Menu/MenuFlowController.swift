//
//  MenuFlowController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

protocol MenuFlowProtocol: AnyObject {
    func showTableView()
    func showCollectionView()
}

class MenuFlowController: MenuFlowProtocol {
    
    // MARK: - Dependencies

    private weak var navigationController: UINavigationController?
    private weak var parentController: UIViewController?
    private weak var viewController: MenuViewController!
    private let dependencyManager: DependencyManager

    // MARK: - Initializers

    init(navigationController: UINavigationController?, parentController: UIViewController?, viewController: MenuViewController, dependencyManager: DependencyManager) {
        self.navigationController = navigationController
        self.parentController = parentController
        self.viewController = viewController
        self.dependencyManager = dependencyManager
    }

    // MARK: - MenuFlowProtocol actions

    func showTableView() {
        guard let navigationController = self.navigationController else {
            return
        }

        BTTFactory.pushIn(
            navigationController: navigationController,
            dependencyManager: self.dependencyManager)
    }

    func showCollectionView() {
        guard let navigationController = self.navigationController else {
            return
        }

        BTCFactory.pushIn(
            navigationController: navigationController,
            dependencyManager: self.dependencyManager)
    }
}
