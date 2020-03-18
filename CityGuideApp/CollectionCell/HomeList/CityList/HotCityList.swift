//
//  HotCityList.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/17/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class HotCityList: UICollectionViewCell {

    @IBOutlet weak var vContainer: UIView!
    @IBOutlet weak var imvCity: UIImageView!
    @IBOutlet weak var vInfo: UIView!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblFeature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.vContainer.clipsToBounds = true
        self.lblFeature.layer.cornerRadius = 5
//       self.vContainer.createShadow(self.vContainer, UIColor.black.cgColor, 12, 30)
    }

}
