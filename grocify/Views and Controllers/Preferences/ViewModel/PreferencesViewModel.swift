//
//  PreferencesViewModel.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation

enum Rows: Int {
    
    case cards
    case alerts
    case shoppingPreferences
    
    var name: String {
        switch self {
        case .cards:
            return LocalizableString.paymentMethods.localizedString
        case .alerts:
            return LocalizableString.alertas.localizedString
        case .shoppingPreferences:
            return LocalizableString.shopPreferences.localizedString
        }
    }
}

protocol PreferencesViewModelViewDelegate: class {

}

protocol PreferencesViewModelCoordinatorDelegate: class {
    func preferencesViewModelDidSelectPaymentMethods(_ viewModel: PreferencesViewModel)
    func preferencesViewModelDidSelectAlerts(_ viewModel: PreferencesViewModel)
    func preferencesViewModelDidSelectShoppingPreferences(_ viewModel: PreferencesViewModel)
}

protocol PreferencesViewModel: class {
    var viewDelegate: PreferencesViewModelViewDelegate? { get set }
    var coordinatorDelegate: PreferencesViewModelCoordinatorDelegate? { get set }
    
    func numberOfRows() -> Int
    func rowAt(index: Int) -> Rows!
    func selectRowAt(index: Int)

}

class PreferencesAPIViewModel: PreferencesViewModel {
    var viewDelegate: PreferencesViewModelViewDelegate?
    var coordinatorDelegate: PreferencesViewModelCoordinatorDelegate?
    
    var preferencesRows: [Rows] = [.cards, .alerts, .shoppingPreferences]

    func numberOfRows() -> Int {
        return preferencesRows.count
    }
    
    func rowAt(index: Int) -> Rows! {
        return preferencesRows[index]
    }
    
    func selectRowAt(index: Int) {
        let row = preferencesRows[index]
        switch row {
        case .alerts:
            coordinatorDelegate?.preferencesViewModelDidSelectAlerts(self)
        case .cards:
            coordinatorDelegate?.preferencesViewModelDidSelectPaymentMethods(self)
        case .shoppingPreferences:
            coordinatorDelegate?.preferencesViewModelDidSelectShoppingPreferences(self)
        
        }
    }

}
