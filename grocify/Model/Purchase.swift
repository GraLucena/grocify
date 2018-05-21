//
//  Purchase.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

struct Purchase: JSONDecodable {
    
    let id: Int?
    let date: String?
    let products: ShopList?
    let market: Market?
    let totalPrice: Double?
    
    // MARK: - Deserialization
    init?(json: JSON) {
        self.id = "ID" <~~ json
        self.date = "FechaCompra" <~~ json
        self.products = "Productos" <~~ json
        self.market = "SupermercadoCompra" <~~ json
        self.totalPrice = "TotalCompra" <~~ json
    }
}
