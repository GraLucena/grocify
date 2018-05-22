//
//  RecipeTableViewCell.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit
import Cosmos

class RecipeTableViewCell: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeRating: CosmosView!
    
    //MARK: - Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
