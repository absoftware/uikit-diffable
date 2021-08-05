//
//  DiffableDataSourceSnapshot+Extensions.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

import UIKit
import DiffableDataSources

extension DiffableDataSourceSnapshot {

    func sectionIdentifier(at index: Int) -> SectionIdentifierType {
        return self.sectionIdentifiers[index]
    }

    func itemIdentifier(at indexPath: IndexPath) -> ItemIdentifierType {
        return self.itemIdentifiers(inSection: self.sectionIdentifiers[indexPath.section])[indexPath.item]
    }

    func indexPath(of itemIdentifier: ItemIdentifierType) -> IndexPath? {
        for (sectionIndex, section) in self.sectionIdentifiers.enumerated() {
            for (itemIndex, item) in self.itemIdentifiers(inSection: section).enumerated() where item.hashValue == itemIdentifier.hashValue {
                return IndexPath(row: itemIndex, section: sectionIndex)
            }
        }
        return nil
    }
}
