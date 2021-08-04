//
//  MenuViewController.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//
//  MVVM module
//  Template designed by Ariel Bogdziewicz.
//

import UIKit
import LayoutExtension

class MenuViewController: UIViewController, UITableViewDelegate, MenuViewModelDelegate {

    // MARK: - Subviews

    let tableView = UITableView(frame: .zero, style: .grouped).autoLayout

    // MARK: - Dependencies
    
    var viewModel: MenuViewModel!

    // MARK: - Properties

    // Properties go here

	// MARK: - UIViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View
        self.view.backgroundColor = .white
        
        // Table view
        self.tableView.delegate = self
        self.view.addSubview(self.tableView) {
            $0.fill()
        }
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

    // MARK: - MenuViewController methods
    
    // Custom methods here...
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    // MARK: - MenuViewModelDelegate methods
    
    // Delegate methods here...

    // MARK: - Actions

    // UI actions here...
}
