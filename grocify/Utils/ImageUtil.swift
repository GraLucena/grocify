//
//  ImageUtil.swift
//  grocify
//
//  Created by Graciela on 21/05/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIImageView {
    
    func loadImage(with imageURL: URL, placeholderImage: UIImage?) {
        af_setImage(withURL: imageURL, placeholderImage: placeholderImage)
    }
}
