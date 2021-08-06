//
//  BTCItemCell.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 06/08/2021.
//

import UIKit
import LayoutExtension

class BTCItemCell: CollectionViewCell {

    // MARK: - Constants

    static let defaultHeight: CGFloat = 50.0

    // MARK: - Subviews

    let titleLabel = UILabel().autoLayout
    let switcher = UISwitch().autoLayout

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

    private func internalInit() {
        // Cell
        self.backgroundColor = .cyan

        // Selected background view
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = .yellow
        self.selectedBackgroundView = selectedBackgroundView

        // Title label
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.systemFont(ofSize: 17.0)
        self.titleLabel.textAlignment = .left
        self.titleLabel.lineBreakMode = .byTruncatingTail
        self.titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        self.contentView.addSubview(self.titleLabel) {
            $0.centerY()
            $0.left(20.0)
        }

        // Switcher
        self.contentView.addSubview(self.switcher) {
            $0.centerY()
            $0.right(20.0)
            self.titleLabel.rightLess(before: $0, offset: -10.0)
        }
    }
}
