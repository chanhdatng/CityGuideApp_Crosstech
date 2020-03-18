//
//  LocationModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
import CoreLocation
struct LocationModal: Codable {
    var latitude: CLLocationDegrees?
    var longitude: CLLocationDegrees?
    
    init(_ latitude: CLLocationDegrees,_ longitude: CLLocationDegrees) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
