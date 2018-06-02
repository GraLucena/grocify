//
//  FridgeViewController.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol FridgeViewControllerCoordinator: class {
    
}

class FridgeViewController: UIViewController {

    weak var coordinator: FridgeViewControllerCoordinator?
    var viewModel: FridgeViewModel
    
    // MARK: - Initializers
    init(viewModel: FridgeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FridgeViewController", bundle: nil)
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension FridgeViewController : FridgeViewModelViewDelegate{
    
}
