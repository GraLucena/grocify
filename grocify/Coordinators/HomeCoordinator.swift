//
//  HomeCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol HomeCoordinatorDelegate: class {

}

class HomeCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController
    weak var delegate: HomeCoordinatorDelegate?
    private var coordinators: CoordinatorsDictionary
    private var tabBar: UITabBarController {
        return rootViewController as! UITabBarController
    }
    
    
    // MARK: - Initializers
    init() {
        rootViewController = UITabBarController()
        coordinators = [:]
    }
    
    // MARK: - Coordinator
    func start() {
        setupTabBar()
    }
    
    // MARK: - Utils
    private func createTabBarItem(title: LocalizableString, asset: Asset, selectedAsset: Asset) -> UITabBarItem {
        let image = UIImage(asset: asset)?.withRenderingMode(.alwaysOriginal)
        let selectedImage = UIImage(asset: selectedAsset)?.withRenderingMode(.alwaysOriginal)
        
        return UITabBarItem(title: title.localizedString,
                            image: image,
                            selectedImage: selectedImage)
    }
    
    // MARK: - Setup
    private func setupTabBar() {
        // Products
        let productsCoordinator = createProductsCoordinator()
        coordinators[ProductsCoordinator.name] = productsCoordinator
        productsCoordinator.start()
        
        // Purchases
        let purchasesCoordinator = createPurchasesCoordinator()
        coordinators[PurchasesCoordinator.name] = purchasesCoordinator
        purchasesCoordinator.start()

        // Fridge
        let fridgeCoordinator = createFridgeCoordinator()
        coordinators[FridgeCoordinator.name] = fridgeCoordinator
        fridgeCoordinator.start()

        // Recipes
        let recipesCoordinator = createRecipesCoordinator()
        coordinators[RecipesCoordinator.name] = recipesCoordinator
        recipesCoordinator.start()
        
        // Preferences
        let preferencesCoordinator = createPreferencesCoordinator()
        coordinators[PreferencesCoordinator.name] = preferencesCoordinator
        preferencesCoordinator.start()

        
        let viewControllers = [productsCoordinator.rootViewController,
                               purchasesCoordinator.rootViewController,
                               fridgeCoordinator.rootViewController,
                               recipesCoordinator.rootViewController,
                               preferencesCoordinator.rootViewController]
        
        tabBar.viewControllers = viewControllers
    }
    
    private func createProductsCoordinator() -> ProductsCoordinator {
        let productsCoordinator = ProductsCoordinator()
        
        let tabBarItem = createTabBarItem(title: .products, asset: .products, selectedAsset: .products_selected)
        productsCoordinator.rootViewController.tabBarItem = tabBarItem

        return productsCoordinator
    }
    
    private func createPreferencesCoordinator() -> PreferencesCoordinator {
        let preferencesCoordinator = PreferencesCoordinator()
        
        let tabBarItem = createTabBarItem(title: .preferences, asset: .preferences, selectedAsset: .preferences_selected)
        preferencesCoordinator.rootViewController.tabBarItem = tabBarItem

        return preferencesCoordinator
    }
    
    private func createPurchasesCoordinator() -> PurchasesCoordinator {
        let purchaseCoordinator = PurchasesCoordinator()
        
        let tabBarItem = createTabBarItem(title: .purchases, asset: .purchases, selectedAsset: .purchases_selected)
        purchaseCoordinator.rootViewController.tabBarItem = tabBarItem

        return purchaseCoordinator
    }
    
    private func createRecipesCoordinator() -> RecipesCoordinator {
        let recipesCoordinator = RecipesCoordinator()
        
        let tabBarItem = createTabBarItem(title: .recipes, asset: .recipes, selectedAsset: .recipes_selected)
        recipesCoordinator.rootViewController.tabBarItem = tabBarItem

        return recipesCoordinator
    }
    
    private func createFridgeCoordinator() -> FridgeCoordinator {
        let fridgeCoordinator = FridgeCoordinator()
        
        let tabBarItem = createTabBarItem(title: .fridge, asset: .fridge, selectedAsset: .fridge_selected)
        fridgeCoordinator.rootViewController.tabBarItem = tabBarItem
        
        return fridgeCoordinator
    }
    
}
