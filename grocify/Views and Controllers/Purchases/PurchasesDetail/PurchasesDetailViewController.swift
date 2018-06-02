//
//  PurchasesDetailViewController.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PurchasesDetailViewControllerCoordinator: class {
    
}

class PurchasesDetailViewController: UIViewController {

    //MARK: - Properties
    weak var coordinator: PurchasesDetailViewControllerCoordinator?
    var viewModel: PurchasesDetailViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: PurchasesDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PurchasesDetailViewController", bundle: nil)
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpTable(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 76
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: String(describing: ProductTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ProductTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: PurchaseHeaderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PurchaseHeaderTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: PurchaseFooterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PurchaseFooterTableViewCell.self))
        tableView.tableFooterView = UIView()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension PurchasesDetailViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfProducts()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseHeaderTableViewCell") as! PurchaseHeaderTableViewCell
        headerCell.marketName.text = viewModel.list.market.name
        headerCell.listName.text = viewModel.list.name
        headerCell.address.text = viewModel.list.market.direction
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "PurchaseFooterTableViewCell") as! PurchaseFooterTableViewCell
        return footerCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductTableViewCell.self), for: indexPath)
        
        if let cell = cell as? ProductTableViewCell {
            let item = viewModel.productsAt(index: indexPath.row)
            cell.productName.text = item?.name
            cell.productPrice.text = String(format: "%.2f €", item?.price ?? 0.0)
            let url = URL(string: item?.image ?? "")
            cell.productImage.loadImage(with: url!, placeholderImage: UIImage(asset: Asset.placeholder))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 62.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 326.0
    }
}
    

// MARK: - PurchasesDetailViewModelViewDelegate
extension PurchasesDetailViewController: PurchasesDetailViewModelViewDelegate {

    
}
