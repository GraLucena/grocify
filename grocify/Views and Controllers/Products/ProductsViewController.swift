//
//  ProductsViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ProductsViewControllerCoordinator: class {
   
}

class ProductsViewController: UIViewController {

    //MARK: - Properties
    weak var coordinator: ProductsViewControllerCoordinator?
    var viewModel: ProductsViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProductsViewController", bundle: nil)
        title = "Productos"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        viewModel.getProducts()
    }
    
    //MARK: - UI
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 76
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension ProductsViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath)
        
        if let cell = cell as? ProductTableViewCell {
            let item = viewModel.productsAt(index: indexPath.row)
            
            cell.productName.text = item?.name
            cell.productPrice.text = String(format: "%.2f €", item?.price ?? 0.0)
            
            
        }
        
        return cell
    }
}

// MARK: - ProductsViewModelViewDelegate
extension ProductsViewController: ProductsViewModelViewDelegate {
    func productsDidChange(viewModel: ProductsViewModel) {
        tableView.reloadData()
    }
}

