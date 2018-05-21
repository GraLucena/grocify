//
//  ProductsViewModel.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol ProductsViewModelViewDelegate: class {
    func productsDidChange(viewModel: ProductsViewModel)
}

protocol ProductsViewModelCoordinatorDelegate: class {
    func productsViewModel(_ viewModel: ProductsViewModel, didSelectArtistWith productId: Int)
}

protocol ProductsViewModel: class {
    var viewDelegate: ProductsViewModelViewDelegate? { get set }
    var coordinatorDelegate: ProductsViewModelCoordinatorDelegate? { get set }
    
    func numberOfProducts() -> Int
    func productsAt(index: Int) -> ProductItem!
    func selectProductAt(index: Int)
    func getProducts()
}

class ProductsAPIViewModel: ProductsViewModel {
    var viewDelegate: ProductsViewModelViewDelegate?
    var coordinatorDelegate: ProductsViewModelCoordinatorDelegate?
    
    private let productsAPI = ProductsAPI()
    
    private var apiProducts: [Product]! = [] {
        didSet { items = apiProducts.map { ProductItem(product: $0) } }
    }
    
    private var items: [ProductItem]? {
        didSet {
            DispatchQueue.main.async() { [unowned self] in
                self.viewDelegate?.productsDidChange(viewModel: self)
            }
        }
    }
    
    func numberOfProducts() -> Int {
        return items?.count ?? 0
    }
    
    func productsAt(index: Int) -> ProductItem! {
        return items?[index]
    }
    
    func selectProductAt(index: Int) {
        guard let product = items?[index] else { return }
        
        coordinatorDelegate?.productsViewModel(self, didSelectArtistWith: product.id)
    }
    
    func getProducts() {
        SVProgressHUD.show()
        productsAPI.getProduct { (products, error) in
            self.apiProducts = products
            SVProgressHUD.dismiss()
        }
    }
}

struct ProductItem {
    
    let id: Int
    let name: String
    let imageURLString: String?
    let price: Double

    var imageURL: URL? {
        
        guard let imageURL = imageURLString, let url = URL(string: imageURL) else {
            return nil
        }
        
        return url
    }
    
    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.price = product.price
        self.imageURLString = product.image
    }
}

