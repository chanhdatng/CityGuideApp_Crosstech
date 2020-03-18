//
//  UserList.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/17/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit


class UserList: UICollectionViewCell {

    @IBOutlet weak var vContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vContainer.clipsToBounds = true
        self.vContainer.layer.cornerRadius = 10
    }

}
