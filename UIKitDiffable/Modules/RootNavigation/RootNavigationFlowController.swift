//
//  RootNavigationFlowController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 04/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

protocol RootNavigationFlowProtocol: AnyObject {
    // Specify navigation actions exposed for view model here...
}

class RootNavigationFlowController: RootNavigationFlowProtocol {
    
    // MARK: - Dependencies

    private weak var window: UIWindow!
    private weak var viewController: RootNavigationViewController!
    private let dependencyManager: DependencyManager

    // MARK: - Initializers

    init(window: UIWindow, viewController: RootNavigationViewController, dependencyManager: DependencyManager) {
        self.window = window
        self.viewController = viewController
        self.dependencyManager = dependencyManager
    }

    // MARK: - RootNavigationFlowProtocol actions

    // Implement navigation actions here...
}
