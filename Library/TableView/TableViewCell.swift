//
//  TableViewCell.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Properties

    static var cellIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.internalInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.internalInit()
    }

    private func internalInit() {}
}

extension UITableView {

    func register<T: TableViewCell>(cell: T.Type) {
        self.register(cell.classForCoder(), forCellReuseIdentifier: cell.cellIdentifier)
    }

    func dequeue<T: TableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: cell.cellIdentifier, for: indexPath) as! T
    }
}
