//
//  CityModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
struct CityModal: Codable {
    var cityName: String
    var imageCityName: String
    var rating: Double
    
    init(_ cityName: String,_ imageCityName: String,_ rate: Double) {
        self.cityName = cityName
        self.imageCityName = imageCityName
        self.rating = rate
    }
}
