//
//  BTTViewModel.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import Foundation

protocol BTTViewModelDelegate: AnyObject {
    // Specify callback methods for view controller here...
}

class BTTViewModel {
    
    // MARK: - Dependencies
    
    weak var delegate: BTTViewModelDelegate?
    private let flowController: BTTFlowProtocol
    
    // MARK: - Properties
    
    // Properties here...
    
    // MARK: - Initializers
    
    init(flowController: BTTFlowProtocol) {
        self.flowController = flowController
    }
    
    // MARK: - Actions
    
    // Handlers of UI actions here...
}
