//
//  BTCFactory.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

enum BTCEvent {
    case completed
}

typealias BTCCallback = (_ event: BTCEvent) -> Void

final class BTCFactory {
    
    static func pushIn(navigationController: UINavigationController, dependencyManager: DependencyManager, callback: BTCCallback? = nil) {

        // View controller
        let viewController = BTCFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager,
            callback: callback)

        // Push controller
        navigationController.pushViewController(viewController, animated: true)
    }

    static func rootIn(navigationController: UINavigationController, dependencyManager: DependencyManager, callback: BTCCallback? = nil) {

        // View controller
        let viewController = BTCFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager,
            callback: callback)

        // Root controller
        navigationController.viewControllers = [viewController]
    }

    static func showIn(parentController: UIViewController, dependencyManager: DependencyManager, callback: BTCCallback? = nil) {

        // View controller
        let viewController = BTCFactory.create(
            navigationController: nil,
            parentController: parentController,
            dependencyManager: dependencyManager,
            callback: callback)

        // Present controller
        parentController.present(viewController, animated: true, completion: nil)
    }

    static func create(navigationController: UINavigationController?, parentController: UIViewController?, dependencyManager: DependencyManager, callback: BTCCallback? = nil) -> BTCViewController {

        // View controller
        let viewController = BTCViewController()
        viewController.title = "Test UICollectionView"

        // Flow controller
        let flowController = BTCFlowController(
            navigationController: navigationController,
            parentController: parentController,
            viewController: viewController,
            dependencyManager: dependencyManager,
            callback: callback)

        // View model
        let viewModel = BTCViewModel(flowController: flowController)
        viewModel.delegate = viewController
        viewController.viewModel = viewModel

        // Return controller
        return viewController
    }
}
