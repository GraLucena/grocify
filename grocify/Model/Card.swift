//
//  Card.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import Gloss

struct Card: JSONDecodable {
    
    let cardNumber: Int?
    let cvv: String?
    let expMonth: String?
    let expYear: String?
    let name: String?
    
    // MARK: - Deserialization
    init?(json: JSON) {
        self.cardNumber = "NumeroTarjeta" <~~ json
        self.cvv = "NumeroSeguridad" <~~ json
        self.expMonth = "MesCaducidad" <~~ json
        self.expYear = "AnoCaducidad" <~~ json
        self.name = "NombrePortador" <~~ json
    }
}
