//
//  RecipesViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol RecipesViewControllerCoordinator: class {
    
}

class RecipesViewController: UIViewController {
    
    weak var coordinator: RecipesViewControllerCoordinator?
    var viewModel: RecipesViewModel
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: RecipesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "RecipesViewController", bundle: nil)
        title = "Recetas"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        viewModel.getRecipes()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UI
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: RecipeTableViewCell.self))
        tableView.tableFooterView = UIView()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension RecipesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRecipes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecipeTableViewCell.self), for: indexPath)
        
        if let cell = cell as? RecipeTableViewCell {
            let item = viewModel.recipesAt(index: indexPath.row)
            
            cell.recipeName.text = item?.name
            cell.recipeRating.rating = item?.rating ?? 0.0
        }
        
        return cell
    }
}

// MARK: - RecipesViewModelViewDelegate
extension RecipesViewController: RecipesViewModelViewDelegate {
    
    func recipesDidChange(viewModel: RecipesViewModel) {
        tableView.reloadData()
    }
}
