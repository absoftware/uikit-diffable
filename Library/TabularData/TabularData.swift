//
//  TabularData.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import Foundation

import UIKit
import DiffableDataSources

struct TabularData<Section: SectionProtocol, Item: ItemProtocol> {

    // MARK: - Properties

    private(set) var diffableSnapshot = DiffableDataSourceSnapshot<Section.Identifier, Item.Identifier>()

    private var sections: [Section.Identifier: Section] = [:]

    private var items: [Item.Identifier: Item] = [:]

    // MARK: - Initializers

    init(useCacheFrom data: TabularData<Section, Item>? = nil) {
        self.sections = data?.sections ?? [:]
        self.items = data?.items ?? [:]
    }

    // MARK: - Section getters

    func index(of sectionIdentifier: Section.Identifier) -> Int? {
        return self.diffableSnapshot.indexOfSection(sectionIdentifier)
    }

//    func section(at index: Int) -> Section {
//        let sectionIdentifier = self.diffableSnapshot.sectionIdentifier(at: index)
//        return self.sections[sectionIdentifier]!
//    }

    func section(identifier: Section.Identifier) -> Section? {
        return self.sections[identifier]
    }

    func sectionInfo(identifier: Section.Identifier) -> (index: Int, section: Section)? {
        guard let index = self.index(of: identifier) else {
            return nil
        }
        return (index: index, section: self.sections[identifier]!)
    }

    // MARK: - Section setters

    mutating func append(sections: [Section]) {
        self.diffableSnapshot.appendSections(sections.identifiers)
        self.update(sections: sections)
    }

    mutating func insert(sections: [Section], before: Section.Identifier) {
        self.diffableSnapshot.insertSections(sections.identifiers, beforeSection: before)
        self.update(sections: sections)
    }

    mutating func insert(sections: [Section], after: Section.Identifier) {
        self.diffableSnapshot.insertSections(sections.identifiers, afterSection: after)
        self.update(sections: sections)
    }

    mutating func update(sections: [Section]) {
        sections.forEach { self.sections[$0.identifier] = $0 }
    }

    mutating func reload(sections: [Section]) {
        self.diffableSnapshot.reloadSections(sections.identifiers)
        self.update(sections: sections)
    }

    /// It removes section identifiers from snapshot.
    /// It doesn't remove sections from cache that they could be available when animation changes.
    /// - Parameter itemIdentifiers: Section identifiers for removal.
    mutating func delete(sectionIdentifiers: [Section.Identifier]) {
        self.diffableSnapshot.deleteSections(sectionIdentifiers)
        // We do not remove here section from `self.sections`.
        // Deleted sections are needed in time of performing changes in collections.
        // It will be cleaned later by `clearDeleted()` method.
        // Search in code how this method is used and where.
    }

    // MARK: - Item getters

    func indexPath(of itemIdentifier: Item.Identifier) -> IndexPath? {
        return self.diffableSnapshot.indexPath(of: itemIdentifier)
    }

//    func item(at indexPath: IndexPath) -> Item {
//        let itemIdentifier = self.diffableSnapshot.itemIdentifier(at: indexPath)
//        return self.items[itemIdentifier]!
//    }

    func item(identifier: Item.Identifier) -> Item? {
        return self.items[identifier]
    }

    func itemInfo(identifier: Item.Identifier) -> (indexPath: IndexPath, item: Item)? {
        guard let indexPath = self.indexPath(of: identifier) else {
            return nil
        }
        return (indexPath: indexPath, item: self.items[identifier]!)
    }

    func itemsCount(identifiers: [Item.Identifier]) -> Int {
        var count = 0
        for identifier in identifiers {
            if self.indexPath(of: identifier) != nil {
                count += 1
            }
        }
        return count
    }

    // MARK: - Item setters

    mutating func insert(items: [Item], beforeItem itemIdentifier: Item.Identifier) {
        self.diffableSnapshot.insertItems(items.identifiers, beforeItem: itemIdentifier)
        self.update(items: items)
    }

    mutating func insert(items: [Item], afterItem itemIdentifier: Item.Identifier) {
        self.diffableSnapshot.insertItems(items.identifiers, afterItem: itemIdentifier)
        self.update(items: items)
    }

    mutating func append(items: [Item], toSection sectionIdentifier: Section.Identifier) {
        self.diffableSnapshot.appendItems(items.identifiers, toSection: sectionIdentifier)
        self.update(items: items)
    }

    mutating func update(items: [Item]) {
        items.forEach { self.items[$0.identifier] = $0 }
    }

    mutating func reload(items: [Item]) {
        self.diffableSnapshot.reloadItems(items.identifiers)
        self.update(items: items)
    }

    /// It removes item identifiers from snapshot.
    /// It doesn't remove items from cache that they could be available when animation changes.
    /// - Parameter itemIdentifiers: Item identifiers for removal.
    mutating func delete(items itemIdentifiers: [Item.Identifier]) {
        self.diffableSnapshot.deleteItems(itemIdentifiers)
        // We do not remove here item from `self.items`.
        // Deleted items are needed in time of performing changes in collections.
        // It will be cleaned later by `clearDeleted()` method.
        // Search in code how this method is used and where.
    }

    // MARK: - Cleaning

    mutating func clearDeleted() {
        // Clean deleted items.
        for itemIdentifier in self.items.keys where self.diffableSnapshot.indexOfItem(itemIdentifier) == nil {
            self.items.removeValue(forKey: itemIdentifier)
        }

        // Clean deleted sections.
        for sectionIdentifier in self.sections.keys where self.diffableSnapshot.indexOfSection(sectionIdentifier) == nil {
            self.sections.removeValue(forKey: sectionIdentifier)
        }
    }
}
