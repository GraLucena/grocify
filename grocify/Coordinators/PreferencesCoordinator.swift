//
//  PreferencesCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PreferencesCoordinatorDelegate: class {
    
}

class PreferencesCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: PreferencesCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var navigationController: UINavigationController {
        return rootViewController as! UINavigationController
    }
    
    // MARK: - Initializers
    init() {
        let preferencesVM = PreferencesAPIViewModel()
        let preferencesVC = PreferencesViewController(viewModel: preferencesVM)
        rootViewController = UINavigationController(rootViewController: preferencesVC)
        coordinators = [:]
        preferencesVC.coordinator = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
}

// MARK: - PanicCoodinator
extension PreferencesCoordinator: PreferencesViewControllerCoordinator {
    
}
