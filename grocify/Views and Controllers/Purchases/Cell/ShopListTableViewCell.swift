//
//  ShopListTableViewCell.swift
//  grocify
//
//  Created by Graciela on 20/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var productsQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
