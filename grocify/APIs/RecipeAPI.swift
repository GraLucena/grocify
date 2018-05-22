//
//  RecipeAPI.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation

typealias RecipeCompletion = (([Recipe], Error?) -> Void)

protocol RecipesAPI: RecipeRepository {
    var networkRepository: RecipeRepository { get }
}

protocol RecipeRepository {
    func getRecipes(onCompletion completion: RecipeCompletion?)
}

struct RecipeAPI: RecipesAPI, RecipeRepository {
    
    let networkRepository: RecipeRepository = RecipeNetworkService()
    
    func getRecipes(onCompletion completion: RecipeCompletion?){
        networkRepository.getRecipes(onCompletion: completion)
    }
}
