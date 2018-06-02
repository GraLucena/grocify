//
//  FridgeViewModel.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import SVProgressHUD

protocol FridgeViewModelViewDelegate: class {
    
}

protocol FridgeViewModelCoordinatorDelegate: class {
}

protocol FridgeViewModel: class {
    var viewDelegate: FridgeViewModelViewDelegate? { get set }
    var coordinatorDelegate: FridgeViewModelCoordinatorDelegate? { get set }

}

class FridgeAPIViewModel: FridgeViewModel {
    var viewDelegate: FridgeViewModelViewDelegate?
    var coordinatorDelegate: FridgeViewModelCoordinatorDelegate?

}

