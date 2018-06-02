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
        purchasesVM.coordinatorDelegate = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
    func showPurchasesDetail(shopList: ShopList) {
        let purchasesDetailVM = PurchasesDetailAPIViewModel(list: shopList)
        let purchasesDetailVC = PurchasesDetailViewController(viewModel: purchasesDetailVM)
        purchasesDetailVC.hidesBottomBarWhenPushed = true

        navigationController.pushViewController(purchasesDetailVC, animated: true)
    }
}

extension PurchasesCoordinator: PurchasesViewControllerCoordinator {
    
}

extension PurchasesCoordinator: PurchasesViewModelCoordinatorDelegate {
    func purchasesViewModel(_ viewModel: PurchasesViewModel, didSelect list: ShopList) {
        showPurchasesDetail(shopList: list)
    }
}
