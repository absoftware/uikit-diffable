//
//  MenuViewData.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

class MenuViewData {

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

        // Sections
        data.append(sections: [
            Section(identifier: .basic)
        ])

        // Items for basic section
        data.append(items: [
            Item(identifier: .basicTableView),
            Item(identifier: .basicCollectionView)
        ], toSection: .basic)

        return data
    }
}
