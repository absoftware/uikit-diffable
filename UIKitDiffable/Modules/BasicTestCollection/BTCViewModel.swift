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
    func viewModel(_ viewModel: BTCViewModel, updatedItemAt indexPath: IndexPath)
}

class BTCViewModel {

    // MARK: - Types

    enum SectionIdentifier {
        case reload
        case reloadWithAnimation
        case reconfigure
        case reconfigureWithAnimation
    }

    struct Section {
        var identifier: SectionIdentifier
        var items: [Item]
    }

    struct Item {
        var identifier: UUID
        var numberOfClicks: Int
        var isOn: Bool
    }
    
    // MARK: - Dependencies
    
    weak var delegate: BTCViewModelDelegate?
    private let flowController: BTCFlowProtocol
    
    // MARK: - Properties
    
    private(set) var sections: [Section] = [
        Section(identifier: .reload, items: [
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false)
        ]),
        Section(identifier: .reloadWithAnimation, items: [
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false)
        ]),
        Section(identifier: .reconfigure, items: [
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false)
        ]),
        Section(identifier: .reconfigureWithAnimation, items: [
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false),
            Item(identifier: UUID(), numberOfClicks: 0, isOn: false)
        ])
    ]
    
    // MARK: - Initializers
    
    init(flowController: BTCFlowProtocol) {
        self.flowController = flowController
    }
    
    // MARK: - Actions

    func selected(indexPath: IndexPath) {
        var item = self.sections[indexPath.section].items[indexPath.item]
        item.isOn = !item.isOn
        item.numberOfClicks += 1
        self.sections[indexPath.section].items[indexPath.item] = item
        self.delegate?.viewModel(self, updatedItemAt: indexPath)
    }
    
    func set(isOn: Bool, at indexPath: IndexPath) {
        var item = self.sections[indexPath.section].items[indexPath.item]
        item.isOn = isOn
        item.numberOfClicks += 1
        self.sections[indexPath.section].items[indexPath.item] = item
        self.delegate?.viewModel(self, updatedItemAt: indexPath)
    }
}
