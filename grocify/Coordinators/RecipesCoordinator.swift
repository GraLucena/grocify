//
//  RecipesCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol RecipesCoordinatorDelegate: class {
    
}

class RecipesCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: RecipesCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var navigationController: UINavigationController {
        return rootViewController as! UINavigationController
    }
    
    // MARK: - Initializers
    init() {
        let recipeVM = RecipesAPIViewModel()
        let recipesVC = RecipesViewController(viewModel: recipeVM)
        rootViewController = UINavigationController(rootViewController: recipesVC)
        coordinators = [:]
        recipesVC.coordinator = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
}

// MARK: - PanicCoodinator
extension RecipesCoordinator: RecipesViewControllerCoordinator {
    
}
