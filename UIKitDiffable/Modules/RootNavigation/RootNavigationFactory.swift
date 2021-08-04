//
//  RootNavigationFactory.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 04/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

final class RootNavigationFactory {
    
    static func setIn(window: UIWindow, dependencyManager: DependencyManager) {

        // View controller
        let viewController = RootNavigationFactory.create(
            window: window,
            dependencyManager: dependencyManager)

        // Set in window
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    static func create(window: UIWindow, dependencyManager: DependencyManager) -> RootNavigationViewController {

        // View controller
        let viewController = RootNavigationViewController()

        // Flow controller
        let flowController = RootNavigationFlowController(
            window: window,
            viewController: viewController,
            dependencyManager: dependencyManager)

        // View model
        let viewModel = RootNavigationViewModel(flowController: flowController)
        viewModel.delegate = viewController
        viewController.viewModel = viewModel
        
        // Display menu
        MenuFactory.rootIn(
            navigationController: viewController,
            dependencyManager: dependencyManager)

        // Return controller
        return viewController
    }
}
