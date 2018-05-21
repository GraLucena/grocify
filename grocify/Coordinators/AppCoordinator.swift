//
//  AppCoordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    var rootViewController: UIViewController {
        let coordinator = coordinators.popFirst()!.1
        return coordinator.rootViewController
    }
    private var window: UIWindow
    private var coordinators: CoordinatorsDictionary
    
    // MARK: - Initializers
    init(window: UIWindow) {
        self.window = window
        coordinators = [:]
    }
    
    // MARK: - Coordinator
    func start() {
        showHome()
    }
    
    // MARK: - Utils
    private func showHome() {
        let homeCoordinator = HomeCoordinator()
        coordinators[HomeCoordinator.name] = homeCoordinator
        window.rootViewController = homeCoordinator.rootViewController
        homeCoordinator.start()
    }
    
    private func showPurchases() {
    }
    
    private func showRecipes() {
    }
    
    private func showPreferences() {
    }
}
