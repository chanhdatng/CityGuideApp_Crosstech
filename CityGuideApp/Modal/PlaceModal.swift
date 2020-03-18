//
//  PlaceModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
struct PlaceModal: Codable {
    var placeName: String
    var address: String
    var descriptions: String
    var imageName: String
    var rating: Double
//    var review: [ReviewModal]?
    
    init(_ placeName: String,_ address: String,_ descriptions: String,_ imageName: String,_ rating: Double) {
        self.placeName = placeName
        self.address = address
        self.descriptions = descriptions
        self.imageName = imageName
        self.rating = rating
//        self.review = review
    }
}
