//
//  placeOfCityModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
struct placeOfCityModal: Codable {
    var cityName: String
    var listPlaceName: [PlaceModal]
    init(_ cityName: String,_ listPlaceName: [PlaceModal]) {
        self.cityName = cityName
        self.listPlaceName = listPlaceName
    }
}
