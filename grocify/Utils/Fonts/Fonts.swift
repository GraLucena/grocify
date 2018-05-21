//
//  Fonts.swift
//  grocify
//
//  Created by Graciela Lucena on 5/13/18.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import Foundation
import UIKit

enum Fonts: String {
    
    case OmnesRg = "omnes_regular"
    case OmnesMd = "omnes_medium"
    case OmnesLg = "omnes_light"

    var font : UIFont{
        return UIFont(name: self.rawValue, size: 13.0) ?? UIFont.systemFont(ofSize: 13.0)
    }
}
