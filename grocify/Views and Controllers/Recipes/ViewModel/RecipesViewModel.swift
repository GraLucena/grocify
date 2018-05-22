//
//  RecipesViewModel.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol RecipesViewModelViewDelegate: class {
    func recipesDidChange(viewModel: RecipesViewModel)
}

protocol RecipesViewModelCoordinatorDelegate: class {
    func recipesViewModel(_ viewModel: RecipesViewModel, didSelectRecipeWith id: Int)
}

protocol RecipesViewModel: class {
    var viewDelegate: RecipesViewModelViewDelegate? { get set }
    var coordinatorDelegate: RecipesViewModelCoordinatorDelegate? { get set }
    
    func numberOfRecipes() -> Int
    func recipesAt(index: Int) -> RecipeItem!
    func selectRecipeAt(index: Int)
    func getRecipes()
}

class RecipesAPIViewModel: RecipesViewModel {
    var viewDelegate: RecipesViewModelViewDelegate?
    var coordinatorDelegate: RecipesViewModelCoordinatorDelegate?
    
    private let recipesAPI = RecipeAPI()
    
    private var apiRecipes: [Recipe]! = [] {
        didSet { items = apiRecipes.map { RecipeItem(recipe: $0) } }
    }
    
    private var items: [RecipeItem]? {
        didSet {
            DispatchQueue.main.async() { [unowned self] in
                self.viewDelegate?.recipesDidChange(viewModel: self)
            }
        }
    }
    
    func numberOfRecipes() -> Int {
        return items?.count ?? 0
    }
    
    func recipesAt(index: Int) -> RecipeItem! {
        return items?[index]
    }
    
    func selectRecipeAt(index: Int) {
        guard let product = items?[index] else { return }
        coordinatorDelegate?.recipesViewModel(self, didSelectRecipeWith: product.id)
    }
    
    func getRecipes() {
        SVProgressHUD.show()
        recipesAPI.getRecipes { (recipes, error) in
            self.apiRecipes = recipes
            SVProgressHUD.dismiss()
        }
    }
}

struct RecipeItem {
    
    let id: Int
    let name: String
    let rating: Double
    
    init(recipe: Recipe) {
        self.id = recipe.id
        self.name = recipe.name
        self.rating = recipe.rating
    }
}
