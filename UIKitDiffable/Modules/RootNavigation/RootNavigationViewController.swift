//
//  RootNavigationViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 04/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit

class RootNavigationViewController: UINavigationController, RootNavigationViewModelDelegate {

    // MARK: - Subviews

    // Subviews go here

    // MARK: - Dependencies
    
    var viewModel: RootNavigationViewModel!

    // MARK: - Properties

    // Properties go here

    // MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
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

    // MARK: - RootNavigationViewController methods
    
    // Custom methods here...

    // MARK: - RootNavigationViewModelDelegate methods
    
    // Delegate methods here...

    // MARK: - Actions

    // UI actions here...
}
