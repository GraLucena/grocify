//
//  PurchaseHeaderTableViewCell.swift
//  grocify
//
//  Created by Graciela on 02/06/2018.
//  Copyright © 2018 Graciela Lucena. All rights reserved.
//

import UIKit
import MapKit

class PurchaseHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var mapVoew: MKMapView!
    @IBOutlet weak var marketName: UILabel!
    @IBOutlet weak var listName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
