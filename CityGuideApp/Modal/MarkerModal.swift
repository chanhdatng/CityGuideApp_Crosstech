//
//  MarkerModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/19/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
struct MarkerModal:Codable {
    var title:String
    var snippet:String
    var location: LocationModal
    
    init(_ title:String,_ snippet:String,_ location: LocationModal) {
        self.title = title
        self.snippet = snippet
        self.location = location
    }
}
