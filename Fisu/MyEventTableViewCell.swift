//
//  MyEventTableViewCell.swift
//  Fisu
//
//  Created by nassim on 07/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit

class MyEventTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    @IBOutlet weak var myLabel1: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
