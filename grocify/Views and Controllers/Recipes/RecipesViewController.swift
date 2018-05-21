//
//  RecipesViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol RecipesViewControllerCoordinator: class {
    
}

class RecipesViewController: UIViewController {
    
    weak var coordinator: RecipesViewControllerCoordinator?

    // MARK: - Initializers
    init() {
        super.init(nibName: "RecipesViewController", bundle: nil)
        title = "Recetas"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

