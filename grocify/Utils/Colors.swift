//
//  Colors.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit
import HexColors

enum Color: String {
    
    case fresh = "4ABDAC"
    case vermilion = "FC4A1A"
    case sunchine = "F7B733"
    case clean = "DFDE3"
    
    var color : UIColor{
        return UIColor(self.rawValue)!
    }
}
