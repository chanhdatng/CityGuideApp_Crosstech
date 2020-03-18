//
//  GiftModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
struct GiftModal: Codable {
    var giftName: String
    var imageGiftName: String
    var total: Int
    var pointsNeeded: Int
    
    init(_ giftName: String,_ imageGiftName: String,_ total: Int,_ pointsNeeded: Int) {
        self.giftName = giftName
        self.imageGiftName = imageGiftName
        self.total = total
        self.pointsNeeded = pointsNeeded
    }
    
}
