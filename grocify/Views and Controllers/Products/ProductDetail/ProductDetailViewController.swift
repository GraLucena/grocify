//
//  ProductDetailViewController.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol ProductDetailViewControllerCoordinator: class {
    
}

class ProductDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var quantityView: UIView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productCategory: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    weak var coordinator: ProductDetailViewControllerCoordinator?
    var viewModel: ProductDetailViewModel

    // MARK: - Initializers
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProductDetailViewController", bundle: nil)
        title = "Producto"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    private func setUpView(){
        productName.text = viewModel.product.name
        productCategory.text = viewModel.product.category
        productQuantity.text = String(format: "%d", viewModel.product.quantity)
        productPrice.text = String(format: "%.2f €", viewModel.product.price ?? 0.0)
        let url = URL(string: viewModel.product.image ?? "")
        productImage.loadImage(with: url!, placeholderImage: UIImage(asset: Asset.placeholder))
        quantityView.backgroundColor = (viewModel.product.quantity < 2) ? Color.redQuantity.color : Color.greenQuantity.color
    }
}

// MARK: - ProductDetailViewModelViewDelegate
extension ProductDetailViewController: ProductDetailViewModelViewDelegate {
    
}
