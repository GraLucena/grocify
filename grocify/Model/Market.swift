//
//  Market.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

//"Supermarket": {
//    "ID": 1,
//    "Code": "M_001",
//    "Name": "Mercadona Moratalaz",
//    "Address": "Calle Arroyo de las Pilillas, 16",
//    "Country": "Spain",
//    "City": "Madrid"
//}

struct Market: JSONDecodable {
    
    let id: Int!
    let code: String!
    let name: String!
    let direction: String!
    let country: String!
    let city: String!

    // MARK: - Deserialization
    init?(json: JSON) {
        self.id = "ID" <~~ json
        self.code = "Code" <~~ json
        self.name = "Name" <~~ json
        self.direction = "Address" <~~ json
        self.country = "Country" <~~ json
        self.city = "City" <~~ json
    }
}

