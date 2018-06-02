//
//  FridgeCoordinator.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol FridgeCoordinatorDelegate: class {
    
}

class FridgeCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: FridgeCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var navigationController: UINavigationController {
        return rootViewController as! UINavigationController
    }
    
    // MARK: - Initializers
    init() {
        let fridgeVM = FridgeAPIViewModel()
        let fridgeVC = FridgeViewController(viewModel: fridgeVM)
        rootViewController = UINavigationController(rootViewController: fridgeVC)
        coordinators = [:]
        fridgeVC.coordinator = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
}

extension FridgeCoordinator: FridgeViewControllerCoordinator {
    
}
