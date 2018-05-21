//
//  PurchasesViewModel.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol PurchasesViewModelViewDelegate: class {
    func purchasesDidChange(viewModel: PurchasesViewModel)
}

protocol PurchasesViewModelCoordinatorDelegate: class {
    func purchasesViewModel(_ viewModel: PurchasesViewModel, didSelectListWith id: Int)
}

protocol PurchasesViewModel: class {
    var viewDelegate: PurchasesViewModelViewDelegate? { get set }
    var coordinatorDelegate: PurchasesViewModelCoordinatorDelegate? { get set }
    
    func numberOfPurchases() -> Int
    func purchasesAt(index: Int) -> ShopListItem!
    func selectPurchaseAt(index: Int)
    func getShoppingLists()
}

class PurchasesAPIViewModel: PurchasesViewModel {
    var viewDelegate: PurchasesViewModelViewDelegate?
    var coordinatorDelegate: PurchasesViewModelCoordinatorDelegate?
    
    private let shoppingAPI = ShoppingAPI()
    
    private var apiPurchases: [ShopList]! = [] {
        didSet { items = apiPurchases.map { ShopListItem(list: $0) } }
    }
    
    private var items: [ShopListItem]? {
        didSet {
            DispatchQueue.main.async() { [unowned self] in
                self.viewDelegate?.purchasesDidChange(viewModel: self)
            }
        }
    }
    
    func numberOfPurchases() -> Int {
        return items?.count ?? 0
    }
    
    func purchasesAt(index: Int) -> ShopListItem! {
        return items?[index]
    }
    
    func selectPurchaseAt(index: Int) {
        guard let product = items?[index] else { return }
        coordinatorDelegate?.purchasesViewModel(self, didSelectListWith: product.id)
    }
    
    func getShoppingLists() {
        SVProgressHUD.show()
        shoppingAPI.getShoppingLists { (list, error) in
            self.apiPurchases = list
            SVProgressHUD.dismiss()
        }
    }
}

struct ShopListItem {
    
    let id: Int
    let name: String
    let market: Market
    let products: [Product]

    init(list: ShopList) {
        self.id = list.id
        self.name = list.name
        self.market = list.market
        self.products = list.products
    }
}
