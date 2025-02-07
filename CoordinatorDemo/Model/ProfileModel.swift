//
//  ProfileModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProfileModel {
    var name: String = ""
    var location: String = ""
    var email: String = ""
    
    init(name: String, location: String, email: String) {
        self.name = name
        self.location = location
        self.email = email
    }
}
