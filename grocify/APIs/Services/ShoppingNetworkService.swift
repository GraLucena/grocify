//
//  ShoppingNetworkService.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

struct ShoppingNetworkService: ShoppingRepository {
   
    func getShoppingLists(onCompletion completion: ShoppingCompletion?) {
        Alamofire.request(Router.getShoppingLists()).validate().responseJSON { response in
            
            var result: Result<[ShopList]> = Result.success([ShopList]())
            
            switch response.result{
            case .success(let jsonDictionary):
                if let items = jsonDictionary as? [JSON]{
                    guard let shoppingList = [ShopList].from(jsonArray: items) else {
                        return
                    }
                    result = Result.success(shoppingList)
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
