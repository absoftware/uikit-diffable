//
//  CollectionViewSectionHeader.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 06/08/2021.
//

import UIKit
import LayoutExtension

class CollectionViewSectionHeader: CollectionReusableView {

    // MARK: - Constants

    static let defaultHeight: CGFloat = 90.0
    
    // MARK: - Subviews

    let titleLabel = UILabel().autoLayout

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
    
    fileprivate func internalInit() {
        // Title label
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.systemFont(ofSize: 18.0)
        self.titleLabel.textAlignment = .center
        self.addSubview(self.titleLabel) {
            $0.center()
        }
    }
}
