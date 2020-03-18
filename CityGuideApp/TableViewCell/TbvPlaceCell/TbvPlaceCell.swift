//
//  TbvPlaceCell.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/21/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class TbvPlaceCell: UITableViewCell {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var imvPlace: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imvPlace.layer.cornerRadius = 12
        self.lblRating.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
