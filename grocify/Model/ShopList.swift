//
//  ShopList.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

enum ShopFrecuency: Int {
    case daily = 0
    case weekly = 1
    case biweekly = 2
    case monthly = 3
    
    var name: String {
        switch self {
        case .daily              : return LocalizableString.daily.localizedString
        case .weekly         : return LocalizableString.weekly.localizedString
        case .monthly         : return LocalizableString.monthly.localizedString
        case .biweekly         : return LocalizableString.biweekly.localizedString
        }
    }
}
struct ShopList: JSONDecodable {
    
    let id: Int!
    let name: String!
    let products: [Product]!
    let market: Market!
    let frecuency: ShopFrecuency?

    // MARK: - Deserialization
    init?(json: JSON) {
        self.id = "ID" <~~ json
        self.name = "Name" <~~ json
        self.products = "Products" <~~ json
        self.market = "Supermarket" <~~ json
        self.frecuency = "Frecuencia" <~~ json
    }
}
