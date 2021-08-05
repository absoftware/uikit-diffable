//
//  MenuTableViewData.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

class MenuTableViewData {

    // MARK: - Types

    struct Section: SectionProtocol {

        enum Identifier {
            case basic
        }

        var identifier: Identifier
    }

    struct Item: ItemProtocol {

        enum Identifier {
            case basicTableView
            case basicCollectionView
        }

        var identifier: Identifier
    }

    // MARK: - Dependencies

    private let viewModel: MenuViewModel

    // MARK: - Initializers

    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Actions

    func createData(useCacheFrom dataCache: TabularData<Section, Item>?) -> TabularData<Section, Item> {

        // Data
        var data = TabularData<Section, Item>(useCacheFrom: dataCache)

        // Convert view model into data
        for section in self.viewModel.sections {

            // Section identifier
            var sectionIdentifier: Section.Identifier!
            switch section.identifier {
            case .basic:
                sectionIdentifier = .basic
            }

            // Section
            data.append(sections: [
                Section(identifier: sectionIdentifier)
            ])

            // Items
            data.append(items: section.items.map {

                // Convert item from view model to data
                switch $0 {
                case .tableView:
                    return Item(identifier: .basicTableView)
                case .collectionView:
                    return Item(identifier: .basicCollectionView)
                }

            }, toSection: sectionIdentifier)
        }

        return data
    }
}
