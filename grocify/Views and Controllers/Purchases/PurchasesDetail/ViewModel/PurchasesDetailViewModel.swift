//
//  PurchasesDetailViewModel.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol PurchasesDetailViewModelViewDelegate: class {
    
}

protocol PurchasesDetailViewModelCoordinatorDelegate: class {
}

protocol PurchasesDetailViewModel: class {
    var viewDelegate: PurchasesDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: PurchasesDetailViewModelCoordinatorDelegate? { get set }
    
    var list: ShopList { get set }
    
    init(list: ShopList)
    func numberOfProducts() -> Int
    func productsAt(index: Int) -> Product!
}

class PurchasesDetailAPIViewModel: PurchasesDetailViewModel {
    var viewDelegate: PurchasesDetailViewModelViewDelegate?
    var coordinatorDelegate: PurchasesDetailViewModelCoordinatorDelegate?
    
    var list: ShopList
    
    required init(list: ShopList) {
        self.list = list
    }
    
    func numberOfProducts() -> Int {
        return list.products.count
    }
    
    func productsAt(index: Int) -> Product! {
        return list.products?[index]
    }
}
