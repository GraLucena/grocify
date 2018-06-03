//
//  AlertsViewController.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

class AlertsViewController: UIViewController {

    // MARK: - Initializers
    init() {
        super.init(nibName: "AlertsViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    

}
