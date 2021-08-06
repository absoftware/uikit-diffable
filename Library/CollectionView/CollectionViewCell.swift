//
//  CollectionViewCell.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    static var cellIdentifier: String {
        return String(describing: self)
    }

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
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

// MARK: -

extension UICollectionView {

    // MARK: - Cell

    func register<T: CollectionViewCell>(cell: T.Type) {
        self.register(cell.classForCoder(), forCellWithReuseIdentifier: cell.cellIdentifier)
    }

    func dequeue<T: CollectionViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: cell.cellIdentifier, for: indexPath) as! T
    }
}
