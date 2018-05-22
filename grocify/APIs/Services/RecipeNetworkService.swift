//
//  RecipeNetworkService.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

struct RecipeNetworkService: RecipeRepository {
    
    func getRecipes(onCompletion completion: RecipeCompletion?) {
        Alamofire.request(Router.getRecipes()).validate().responseJSON { response in
            
            var result: Result<[Recipe]> = Result.success([Recipe]())
            
            switch response.result{
            case .success(let jsonDictionary):
                if let items = jsonDictionary as? [JSON]{
                    guard let recipes = [Recipe].from(jsonArray: items) else {
                        return
                    }
                    result = Result.success(recipes)
                }
            case .failure(let error):
                result = Result.failure(error)
            }
            
            if let completion = completion {
                completion(result.value ?? [], result.error)
            }
        }
    }
}
