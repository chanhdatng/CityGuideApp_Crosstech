//
//  ListModal.swift
//  CityGuideApp
//
//  Created by Chanh Dat Ng on 8/14/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation
import UIKit

struct FoodModal {
    var img : String
    var title: String
    var description: String
    
    init(_ img: String,_ title: String, _ description: String) {
        self.img = img
        self.title = title
        self.description = description
    }
}

