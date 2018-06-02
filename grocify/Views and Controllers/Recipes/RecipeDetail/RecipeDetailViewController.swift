//
//  RecipeDetailViewController.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol RecipeDetailViewControllerCoordinator: class {
    
}

class RecipeDetailViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var recipeDescription: UILabel!
    
    weak var coordinator: RecipeDetailViewControllerCoordinator?
    var viewModel: RecipeDetailViewModel
    
    // MARK: - Initializers
    init(viewModel: RecipeDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "RecipeDetailViewController", bundle: nil)
        title = "Receta"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    private func setUpView(){
        recipeDescription.text = viewModel.recipe.description
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension RecipeDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfIngredients()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath)
        
        if let cell = cell as? ProductCollectionViewCell {
            let item = viewModel.ingredientAt(index: indexPath.row)
            
            
        }
        
        return cell
    }
}

// MARK: - RecipeDetailViewModelViewDelegate
extension RecipeDetailViewController: RecipeDetailViewModelViewDelegate {
    
}
