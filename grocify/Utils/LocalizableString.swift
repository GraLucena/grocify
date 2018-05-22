//
//  LocalizableString.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation

enum LocalizableString: String {
    //MARK: - Global
    case ok = "OK"
    case cancel = "Cancel"

    //MARK: - TabBar
    case products = "Productos"
    case preferences = "Ajustes"
    case recipes = "Recetas"
    case purchases = "Lista de Compras"

    //MARK: - Frecuency
    case monthly = "Mensual"
    case weekly = "Semanal"
    case daily = "Diario"
    case biweekly = "Quincenal"

    //MARK: - Preferences
    case paymentMethods = "Métodos de pago"
    case alertas = "Notificaciones"
    case shopPreferences = "Preferencias de compra"


    var localizedString: String {
        return NSLocalizedString(rawValue, comment: "")
    }
}
