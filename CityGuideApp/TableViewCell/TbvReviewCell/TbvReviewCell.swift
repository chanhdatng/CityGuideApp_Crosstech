//
//  TbvReviewCell.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/23/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import UIKit

class TbvReviewCell: UITableViewCell {
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblRview: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var lblName : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgUser.layer.cornerRadius = self.imgUser.frame.width/2
        self.lbldate.clipsToBounds = true
        self.lbldate.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
