//
//  UserInformationViewModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class UserProfileViewModel: ViewModel {
    var coordinator: Coordinator?
    var profile = ProfileModel(name: "Wade", location: "Taipei 101", email: "hueiderhuang@gmail.com")
    
    init(coordinator: UserCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
