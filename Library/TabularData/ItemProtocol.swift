//
//  ItemProtocol.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

protocol ItemProtocol {
    associatedtype Identifier: Hashable
    var identifier: Identifier { get }
}

extension Array where Element: ItemProtocol {
    var identifiers: [Element.Identifier] {
        return self.map { $0.identifier }
    }
}
