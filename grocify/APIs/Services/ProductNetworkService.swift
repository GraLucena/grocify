//
//  ProductNetworkService.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Alamofire
import Gloss

struct ProductNetworkService: ProductRepository {
    
    func getProduct(onCompletion completion: ProductCompletion?) {
        
        Alamofire.request(Router.getProducts()).validate().responseJSON { response in
            
            var result: Result<[Product]> = Result.success([Product]())
            
            switch response.result{
            case .success(let jsonDictionary):
                if let items = jsonDictionary as? [JSON]{
                    guard let products = [Product].from(jsonArray: items) else {
                        return
                    }
                    result = Result.success(products)
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
