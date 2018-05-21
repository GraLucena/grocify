//
//  ShoppingAPI.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation

typealias ShoppingCompletion = (([ShopList], Error?) -> Void)

protocol ShopAPI: ShoppingRepository {
    var networkRepository: ShoppingRepository { get }
}

protocol ShoppingRepository {
    func getShoppingLists(onCompletion completion: ShoppingCompletion?)
}

struct ShoppingAPI: ShopAPI, ShoppingRepository {
    
    let networkRepository: ShoppingRepository = ShoppingNetworkService()
    
    func getShoppingLists(onCompletion completion: ShoppingCompletion?){
        networkRepository.getShoppingLists(onCompletion: completion)
    }
}
