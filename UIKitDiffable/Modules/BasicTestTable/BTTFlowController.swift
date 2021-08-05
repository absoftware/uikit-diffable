//
//  BTTFlowController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

protocol BTTFlowProtocol: AnyObject {
    // Specify navigation actions exposed for view model here...
}

class BTTFlowController: BTTFlowProtocol {

    // MARK: - Dependencies

    private weak var navigationController: UINavigationController?
    private weak var parentController: UIViewController?
    private weak var viewController: BTTViewController!
    private let dependencyManager: DependencyManager
    private let callback: BTTCallback?

    // MARK: - Initializers

    init(navigationController: UINavigationController?, parentController: UIViewController?, viewController: BTTViewController, dependencyManager: DependencyManager, callback: BTTCallback? = nil) {
        self.navigationController = navigationController
        self.parentController = parentController
        self.viewController = viewController
        self.dependencyManager = dependencyManager
        self.callback = callback
    }

    // MARK: - BTTFlowProtocol actions

    // Implement navigation actions here...
}
