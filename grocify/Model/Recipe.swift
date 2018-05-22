//
//  Recipe.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

struct Recipe: JSONDecodable {
    
    let id: Int!
    let ingredients: [Product]!
    let duration: Double!
    let rating: Double!
    let description: String!
    let name: String!
    
    // MARK: - Deserialization
    init?(json: JSON) {
        self.id = "ID" <~~ json
        self.ingredients = "Ingredients" <~~ json
        self.duration = "CookTime" <~~ json
        self.rating = "Rating" <~~ json
        self.description = "Description" <~~ json
        self.name = "Name" <~~ json
    }
}


