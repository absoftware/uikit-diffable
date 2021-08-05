//
//  SectionProtocol.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

protocol SectionProtocol {
    associatedtype Identifier: Hashable
    var identifier: Identifier { get }
}

extension Array where Element: SectionProtocol {
    var identifiers: [Element.Identifier] {
        return self.map { $0.identifier }
    }
}
