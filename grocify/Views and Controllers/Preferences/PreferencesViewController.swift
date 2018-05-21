//
//  PreferencesViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PreferencesViewControllerCoordinator: class {
    
}

class PreferencesViewController: UIViewController {
    
    weak var coordinator: PreferencesViewControllerCoordinator?

    // MARK: - Initializers
    init() {
        super.init(nibName: "PreferencesViewController", bundle: nil)
        title = "Preferencias"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
