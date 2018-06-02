//
//  PreferencesViewController.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

protocol PreferencesViewControllerCoordinator: class {
    
}

class PreferencesViewController: UIViewController {
    
    weak var coordinator: PreferencesViewControllerCoordinator?
    var viewModel: PreferencesViewModel

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initializers
    init(viewModel: PreferencesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PreferencesViewController", bundle: nil)
        title = "Preferencias"
        viewModel.viewDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UI
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: String(describing: PreferenceTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PreferenceTableViewCell.self))
        tableView.tableFooterView = UIView()
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension PreferencesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PreferenceTableViewCell.self), for: indexPath)
        
        if let cell = cell as? PreferenceTableViewCell {
            let item = viewModel.rowAt(index: indexPath.row)
            
            cell.title.text = item?.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel.selectRowAt(index: indexPath.row)
    }
}

// MARK: - PreferencesViewModelViewDelegate
extension PreferencesViewController: PreferencesViewModelViewDelegate {
    
   
}
