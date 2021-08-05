//
//  BTTFactory.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

enum BTTEvent {
    case completed // Edit events depending on your needs here...
}

typealias BTTCallback = (_ event: BTTEvent) -> Void

final class BTTFactory {
    
    static func pushIn(navigationController: UINavigationController, dependencyManager: DependencyManager, callback: BTTCallback? = nil) {

        // View controller
        let viewController = BTTFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager,
            callback: callback)

        // Push controller
        navigationController.pushViewController(viewController, animated: true)
    }

    static func rootIn(navigationController: UINavigationController, dependencyManager: DependencyManager, callback: BTTCallback? = nil) {

        // View controller
        let viewController = BTTFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager,
            callback: callback)

        // Root controller
        navigationController.viewControllers = [viewController]
    }

    static func showIn(parentController: UIViewController, dependencyManager: DependencyManager, callback: BTTCallback? = nil) {

        // View controller
        let viewController = BTTFactory.create(
            navigationController: nil,
            parentController: parentController,
            dependencyManager: dependencyManager,
            callback: callback)

        // Present controller
        parentController.present(viewController, animated: true, completion: nil)
    }

    static func create(navigationController: UINavigationController?, parentController: UIViewController?, dependencyManager: DependencyManager, callback: BTTCallback? = nil) -> BTTViewController {

        // View controller
        let viewController = BTTViewController()
        viewController.title = "Test UITableView"

        // Flow controller
        let flowController = BTTFlowController(
            navigationController: navigationController,
            parentController: parentController,
            viewController: viewController,
            dependencyManager: dependencyManager,
            callback: callback)

        // View model
        let viewModel = BTTViewModel(flowController: flowController)
        viewModel.delegate = viewController
        viewController.viewModel = viewModel

        // Return controller
        return viewController
    }
}
