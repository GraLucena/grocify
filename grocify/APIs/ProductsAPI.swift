//
//  ProductsAPI.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation

typealias ProductCompletion = (([Product], Error?) -> Void)

protocol API: ProductRepository {
    var networkRepository: ProductRepository { get }
}

protocol ProductRepository {
    func getProduct(onCompletion completion: ProductCompletion?)
}

struct ProductsAPI: API, ProductRepository {
    
    let networkRepository: ProductRepository = ProductNetworkService()
    
    func getProduct(onCompletion completion: ProductCompletion?){
        networkRepository.getProduct(onCompletion: completion)
    }
}
