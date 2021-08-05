//
//  BTCViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

class BTCViewController: UIViewController, UICollectionViewDelegateFlowLayout, BTCViewModelDelegate {

    // MARK: - Subviews

    var collectionView: UICollectionView!

    // MARK: - Dependencies
    
    var viewModel: BTCViewModel!

    // MARK: - Properties

    // Properties go here

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // View
        self.view.backgroundColor = .white

        // Collection view layout
        let layout = UICollectionViewFlowLayout()

        // Collection view
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).autoLayout
        self.collectionView.backgroundColor = .white
        self.view.addSubview(self.collectionView) {
            $0.fill()
        }
    }

    // MARK: - BTCViewController methods
    
    // Custom methods here...

    // MARK: - UICollectionViewDelegateFlowLayout methods

    // MARK: - BTCViewModelDelegate methods
    
    // Delegate methods here...

    // MARK: - Actions

    // UI actions here...
}
