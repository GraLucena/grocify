//
//  Product.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

struct Product: JSONDecodable {
    
    let id: Int!
    let code: String!
    let name: String!
    let quantity: Int!
    let price: Double!
    let category: String!
    let image: String?

    // MARK: - Deserialization
    init?(json: JSON) {
        self.id = "ID" <~~ json
        self.code = "Code" <~~ json
        self.name = "Name" <~~ json
        self.quantity = "Quantity" <~~ json
        self.price = "Price" <~~ json
        self.category = "Category" <~~ json
        self.image = "Image" <~~ json
    }
}
