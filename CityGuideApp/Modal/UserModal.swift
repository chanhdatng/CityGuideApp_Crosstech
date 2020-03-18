//
//  UserModal.swift
//  CityGuideApp
//
//  Created by Trương Quốc Tài on 8/15/19.
//  Copyright © 2019 Chanh Dat Ng. All rights reserved.
//

import Foundation

struct UserModal: Codable {
    var userName: String
    var passWord: String
    var phone: String
    var email: String
    var imgAvatarName: String
    var availablePoints: Int
    var visitedCity: [String]
    var bio: String
    var DoB: String
    
    init(_ userName: String,_ pass: String,_ phone: String,_ email:String,_ imgAvatarName: String,_ points: Int,_ visitedCity: [String],_ bio: String,_ dob: String) {
        self.userName = userName
        self.phone = phone
        self.passWord = pass
        self.email = email
        self.imgAvatarName = imgAvatarName
        self.availablePoints = points
        self.visitedCity = visitedCity
        self.bio = bio
        self.DoB = dob
    }
}
