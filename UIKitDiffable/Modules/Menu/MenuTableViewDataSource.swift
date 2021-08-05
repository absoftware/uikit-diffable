//
//  MenuTableViewDataSource.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import UIKit
import DiffableDataSources

class MenuTableViewDataSource: TableViewDiffableDataSource<MenuTableViewData.Section.Identifier, MenuTableViewData.Item.Identifier> {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionIdentifier = self.sectionIdentifier(for: section)!
        switch sectionIdentifier {
        case .basic:
            return "Basic tests"
        }
    }
}
