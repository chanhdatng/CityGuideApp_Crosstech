//
//  ReviewModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation

struct ReviewModal: Codable {
    var date: String
    var userNameReview: String
    var imageNameReview: String
    var description: String
    
    
    init(_ date: String,_ userNameReview: String,_ imageNameReview: String,_ description: String) {
        self.date = date
        self.userNameReview = userNameReview
        self.imageNameReview = imageNameReview
        self.description = description
        
    }
}
