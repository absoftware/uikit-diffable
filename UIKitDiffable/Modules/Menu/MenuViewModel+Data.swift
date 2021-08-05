//
//  MenuViewModel+Data.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

extension MenuViewModel {

    func createData(useCacheFrom dataCache: TabularData<MenuViewDataSection, MenuViewDataItem>?) -> TabularData<MenuViewDataSection, MenuViewDataItem> {

        // Data
        var data = TabularData<MenuViewDataSection, MenuViewDataItem>(useCacheFrom: dataCache)

        // Sections
        data.append(sections: [
            MenuViewDataSection(identifier: .basic)
        ])

        // Items for basic section
        data.append(items: [
            MenuViewDataItem(identifier: .basicTableView),
            MenuViewDataItem(identifier: .basicCollectionView)
        ], toSection: .basic)

        return data
    }
}
