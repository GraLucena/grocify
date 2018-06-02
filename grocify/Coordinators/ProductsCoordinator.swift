//
//  ProductsCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//


import UIKit

protocol ProductsCoordinatorDelegate: class {

}

class ProductsCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: ProductsCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var navigationController: UINavigationController {
        return rootViewController as! UINavigationController
    }
    
    // MARK: - Initializers
    init() {
        let productsVM = ProductsAPIViewModel()
        let productsVC = ProductsViewController(viewModel: productsVM)
        rootViewController = UINavigationController(rootViewController: productsVC)
        coordinators = [:]
        productsVC.coordinator = self
        productsVM.coordinatorDelegate = self
    }
    
    // MARK: - Coordinator
    func start() {}
    
    func showProductDetail(product: Product) {
        let productDetailVM = ProductDetailAPIViewModel(product: product)
        let productDetailVC = ProductDetailViewController(viewModel: productDetailVM)
        productDetailVC.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(productDetailVC, animated: true)
    }
}

extension ProductsCoordinator: ProductsViewControllerCoordinator {
    
}

extension ProductsCoordinator: ProductsViewModelCoordinatorDelegate {
    
    func productsViewModel(_ viewModel: ProductsViewModel, didSelect product: Product) {
        showProductDetail(product: product)
    }
}
