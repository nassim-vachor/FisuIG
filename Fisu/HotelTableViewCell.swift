//
//  HotelTableViewCell.swift
//  Fisu
//
//  Created by Djeneba KANE on 27/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var hotelNomLabel: UILabel!
    
    @IBOutlet weak var hotelHorLabel: UILabel!
    
    @IBOutlet weak var hotelImage: UIImageView!
    
    
}
