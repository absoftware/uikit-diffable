//
//  BTTViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 05/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

class BTTViewController: UIViewController, BTTViewModelDelegate {

    // MARK: - Subviews

    // Subviews go here

    // MARK: - Dependencies
    
    var viewModel: BTTViewModel!

    // MARK: - Properties

    // Properties go here

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // View
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - BTTViewController methods
    
    // Custom methods here...

    // MARK: - BTTViewModelDelegate methods
    
    // Delegate methods here...

    // MARK: - Actions

    // UI actions here...
}
