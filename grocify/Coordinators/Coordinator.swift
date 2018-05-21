//
//  Coordinator.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit

typealias CoordinatorsDictionary = [String: Coordinator]

protocol Coordinator {
    var rootViewController: UIViewController { get }
    
    func start()
}

extension Coordinator {
    static var name: String {
        return String(describing: self)
    }
}
