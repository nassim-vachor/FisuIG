//
//  DisplayActivityTableViewCell.swift
//  Fisu
//
//  Created by nassim on 27/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit

class DisplayActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var ActivityLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
