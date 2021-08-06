//
//  CollectionReusableView.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {

    // MARK: - Properties

    static var viewIdentifier: String {
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

    fileprivate func internalInit() {}
}

// MARK: -

extension UICollectionView {

    // MARK: - Header

    func register<T: CollectionReusableView>(header: T.Type) {
        self.register(header.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.viewIdentifier)
    }

    func dequeue<T: CollectionReusableView>(header: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: header.viewIdentifier, for: indexPath) as! T
    }

    // MARK: - Footer

    func register<T: CollectionReusableView>(footer: T.Type) {
        self.register(footer.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.viewIdentifier)
    }

    func dequeue<T: CollectionReusableView>(footer: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footer.viewIdentifier, for: indexPath) as! T
    }
}
