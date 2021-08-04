//
//  MenuFactory.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

final class MenuFactory {
    
    static func pushIn(navigationController: UINavigationController, dependencyManager: DependencyManager) {

        // View controller
        let viewController = MenuFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager)

        // Push controller
        navigationController.pushViewController(viewController, animated: true)
    }

    static func rootIn(navigationController: UINavigationController, dependencyManager: DependencyManager) {

        // View controller
        let viewController = MenuFactory.create(
            navigationController: navigationController,
            parentController: nil,
            dependencyManager: dependencyManager)

        // Root controller
        navigationController.viewControllers = [viewController]
    }

    static func showIn(parentController: UIViewController, dependencyManager: DependencyManager) {

        // View controller
        let viewController = MenuFactory.create(
            navigationController: nil,
            parentController: parentController,
            dependencyManager: dependencyManager)

        // Present controller
        parentController.present(viewController, animated: true, completion: nil)
    }

    static func create(navigationController: UINavigationController?, parentController: UIViewController?, dependencyManager: DependencyManager) -> MenuViewController {

        // View controller
        let viewController = MenuViewController()
        viewController.title = "UIKit Diffable"

        // Flow controller
        let flowController = MenuFlowController(
            navigationController: navigationController,
            parentController: parentController,
            viewController: viewController,
            dependencyManager: dependencyManager)

        // View model
        let viewModel = MenuViewModel(flowController: flowController)
        viewModel.delegate = viewController
        viewController.viewModel = viewModel

        // Return controller
        return viewController
    }
}
