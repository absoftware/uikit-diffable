//
//  RootNavigationViewModel.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 04/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import Foundation

protocol RootNavigationViewModelDelegate: AnyObject {
    // Specify callback methods for view controller here...
}

class RootNavigationViewModel {
    
    // MARK: - Dependencies
    
    weak var delegate: RootNavigationViewModelDelegate?
    private let flowController: RootNavigationFlowProtocol
    
    // MARK: - Properties
    
    // Properties here...
    
    // MARK: - Initializers
    
    init(flowController: RootNavigationFlowProtocol) {
        self.flowController = flowController
    }
    
    // MARK: - Actions
    
    // Handlers of UI actions here...
}
