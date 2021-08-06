//
//  BTCCollectionViewData.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

struct BTCCollectionViewData {

    // MARK: - Types

    struct Section: SectionProtocol {

        enum Identifier {
            case testReload
            case testReloadWithAnimation
            case testReconfigure
            case testReconfigureWithAnimation
        }

        var identifier: Identifier
    }

    struct Item: ItemProtocol {

        var identifier: UUID
        var numberOfClicks: Int
        var isSwitchOn: Bool
    }

    // MARK: - Dependencies

    private let viewModel: BTCViewModel

    // MARK: - Initializers

    init(viewModel: BTCViewModel) {
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
            case .reload:
                sectionIdentifier = .testReload
            case .reloadWithAnimation:
                sectionIdentifier = .testReloadWithAnimation
            case .reconfigure:
                sectionIdentifier = .testReconfigure
            case .reconfigureWithAnimation:
                sectionIdentifier = .testReconfigureWithAnimation
            }

            // Section
            data.append(sections: [
                Section(identifier: sectionIdentifier)
            ])

            // Items
            data.append(items: section.items.map {

                // Convert item from view model to data
                return Item(
                    identifier: $0.identifier,
                    numberOfClicks: $0.numberOfClicks,
                    isSwitchOn: $0.isOn)

            }, toSection: sectionIdentifier)
        }

        return data
    }

    func createItem(from indexPath: IndexPath) -> Item {
        let item = self.viewModel.sections[indexPath.section].items[indexPath.item]
        return Item(
            identifier: item.identifier,
            numberOfClicks: item.numberOfClicks,
            isSwitchOn: item.isOn)
    }
}
