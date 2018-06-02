//
//  ProductDetailViewModel.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol ProductDetailViewModelViewDelegate: class {
    
}

protocol ProductDetailViewModelCoordinatorDelegate: class {
    
}

protocol ProductDetailViewModel: class {
    var viewDelegate: ProductDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: ProductDetailViewModelCoordinatorDelegate? { get set }
    
    var product: Product { get set }
    
    init(product: Product)
}

class ProductDetailAPIViewModel: ProductDetailViewModel {
    var viewDelegate: ProductDetailViewModelViewDelegate?
    var coordinatorDelegate: ProductDetailViewModelCoordinatorDelegate?
    
    var product: Product
   
    required init(product: Product) {
        self.product = product
    }
}
