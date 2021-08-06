//
//  IndexPath+Extensions.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 06/08/2021.
//

import Foundation

extension IndexPath {

    // MARK: - Conversion to integer

    static let maximumNumberOfRowsInSection = 10000000

    init(integerValue: Int) {
        self.init(row: integerValue%IndexPath.maximumNumberOfRowsInSection, section: integerValue/IndexPath.maximumNumberOfRowsInSection)
    }

    var integerValue: Int {
        return self.section*IndexPath.maximumNumberOfRowsInSection + self.row
    }

    // MARK: - Incrementing values

    func with(item: Int) -> IndexPath {
        return IndexPath(item: item, section: self.section)
    }

    func withItem(offset: Int) -> IndexPath {
        return IndexPath(item: self.item + offset, section: self.section)
    }
}
