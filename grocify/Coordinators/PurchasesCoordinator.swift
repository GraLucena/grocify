//
//  PurchasesCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PurchasesCoordinatorDelegate: class {
    
}

class PurchasesCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: PurchasesCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var navigationController: UINavigationController {
        return rootViewController as! UINavigationController
    }
    
    // MARK: - Initializers
    init() {
        let purchasesVM = PurchasesAPIViewModel()
        let purchasesVC = PurchasesViewController(viewModel: purchasesVM)
        rootViewController = UINavigationController(rootViewController: purchasesVC)
        coordinators = [:]
        purchasesVC.coordinator = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
}

// MARK: - PanicCoodinator
extension PurchasesCoordinator: PurchasesViewControllerCoordinator {
    
}
