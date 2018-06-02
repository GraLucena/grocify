//
//  RecipeDetailViewModel.swift
//  grocify
//
//  Created by Graciela on 22/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol RecipeDetailViewModelViewDelegate: class {

}

protocol RecipeDetailViewModelCoordinatorDelegate: class {

}

protocol RecipeDetailViewModel: class {
    var viewDelegate: RecipeDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: RecipeDetailViewModelCoordinatorDelegate? { get set }
    
    var recipe: Recipe { get set }

    init(recipe: Recipe)
    func numberOfIngredients() -> Int
    func ingredientAt(index: Int) -> Product!
}

class RecipeDetailAPIViewModel: RecipeDetailViewModel {
    var viewDelegate: RecipeDetailViewModelViewDelegate?
    var coordinatorDelegate: RecipeDetailViewModelCoordinatorDelegate?
    
    var recipe: Recipe
    private var items: [Product]? {
        didSet {
            items = recipe.ingredients
        }
    }
    
    required init(recipe: Recipe) {
        self.recipe = recipe
        self.items = recipe.ingredients
    }
    
    func numberOfIngredients() -> Int {
        return items?.count ?? 0
    }
    
    func ingredientAt(index: Int) -> Product! {
        return items?[index]
    }
}
