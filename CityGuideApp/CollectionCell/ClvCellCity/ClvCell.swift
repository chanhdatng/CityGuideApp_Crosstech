//
//  ClvCell.swift
//  CityGuide
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Trương Quốc Tài. All rights reserved.
//

import UIKit

class ClvCell: UICollectionViewCell {
    
    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var imgCity: UIImageView!
    @IBOutlet weak var vBlur: UIView!
    @IBOutlet weak var lblCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.vContainer.clipsToBounds = true
        self.vContainer.layer.cornerRadius = 12
        self.imgCity.layer.cornerRadius = 12
        self.vBlur.layer.cornerRadius = 12
        self.vBlur.alpha = 0.3
    }

}
