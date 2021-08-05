//
//  MenuViewData.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

struct MenuViewDataSection: SectionProtocol {

    enum Identifier {
        case basic
    }

    var identifier: Identifier
}

struct MenuViewDataItem: ItemProtocol {

    enum Identifier {
        case basicTableView
        case basicCollectionView
    }

    var identifier: Identifier
}
