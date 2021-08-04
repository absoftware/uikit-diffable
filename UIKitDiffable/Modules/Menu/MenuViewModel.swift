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
    
    // MARK: - Dependencies
    
    weak var delegate: MenuViewModelDelegate?
    private let flowController: MenuFlowController
    
    // MARK: - Properties
    
    // Properties here...
    
    // MARK: - Initializers
    
    init(flowController: MenuFlowController) {
        self.flowController = flowController
    }
    
    // MARK: - Actions
    
    // Handlers of UI actions here...
}
