//
//  BTCViewModel.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import Foundation

protocol BTCViewModelDelegate: AnyObject {
    // Specify callback methods for view controller here...
}

class BTCViewModel {
    
    // MARK: - Dependencies
    
    weak var delegate: BTCViewModelDelegate?
    private let flowController: BTCFlowProtocol
    
    // MARK: - Properties
    
    // Properties here...
    
    // MARK: - Initializers
    
    init(flowController: BTCFlowProtocol) {
        self.flowController = flowController
    }
    
    // MARK: - Actions
    
    // Handlers of UI actions here...
}
