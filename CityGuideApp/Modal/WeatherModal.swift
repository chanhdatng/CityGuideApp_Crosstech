//
//  WeatherModal.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/21/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation

struct WeatherInfoModal: Codable {
    var id : Double
    var main: String
    var description: String
    var icon: String
    
    init(){
        self.id = 0
        self.main = ""
        self.description = ""
        self.icon = ""
    }
}

struct WeatherModal: Codable {
    var name: String
    var weather: WeatherInfoModal
    init() {
        self.name = ""
        self.weather = WeatherInfoModal.init()
    }
}
