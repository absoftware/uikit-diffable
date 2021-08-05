//
//  BTCFlowController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

protocol BTCFlowProtocol: AnyObject {
    // Specify navigation actions exposed for view model here...
}

// TODO: Intercept somehow event from navigation's back button.
class BTCFlowController: BTCFlowProtocol {
    
    // MARK: - Dependencies

    private weak var navigationController: UINavigationController?
    private weak var parentController: UIViewController?
    private weak var viewController: BTCViewController!
    private let dependencyManager: DependencyManager
    private let callback: BTCCallback?

    // MARK: - Initializers

    init(navigationController: UINavigationController?, parentController: UIViewController?, viewController: BTCViewController, dependencyManager: DependencyManager, callback: BTCCallback? = nil) {
        self.navigationController = navigationController
        self.parentController = parentController
        self.viewController = viewController
        self.dependencyManager = dependencyManager
        self.callback = callback
    }

    // MARK: - BTCFlowProtocol actions

    // Implement navigation actions here...
}
