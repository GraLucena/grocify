//
//  PurchasesViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PurchasesViewControllerCoordinator: class {
    
}

class PurchasesViewController: UIViewController {
    
    weak var coordinator: PurchasesViewControllerCoordinator?
    var viewModel: PurchasesViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: PurchasesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PurchasesViewController", bundle: nil)
        title = "Lista de Compras"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        viewModel.getShoppingLists()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UI
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: ShopListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ShopListTableViewCell.self))
        tableView.tableFooterView = UIView()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension PurchasesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPurchases()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ShopListTableViewCell.self), for: indexPath)
        
        if let cell = cell as? ShopListTableViewCell {
            let item = viewModel.purchasesAt(index: indexPath.row)

            cell.listName.text = item?.name
            cell.marketName.text = item?.market.name
            cell.productsQuantity.text = String(format: "%d", item?.products.count ?? 0)
        }
        
        return cell
    }
}

// MARK: - ProductsViewModelViewDelegate
extension PurchasesViewController: PurchasesViewModelViewDelegate {
   
    func purchasesDidChange(viewModel: PurchasesViewModel) {
        tableView.reloadData()
    }
}

