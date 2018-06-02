//
//  Asset.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

enum Asset: String {
    
    case products = "products"
    case products_selected = "products_selected"
    case recipes = "recipes"
    case recipes_selected = "recipes_selected"
    case preferences = "preferences"
    case preferences_selected = "preferences_selected"
    case purchases = "purchases"
    case purchases_selected = "purchases_selected"
    case fridge = "fridge"
    case fridge_selected = "fridge_selected"

    case placeholder = "placeholder"
}

extension UIImage {
    convenience init?(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}
