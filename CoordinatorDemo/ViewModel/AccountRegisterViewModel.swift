//
//  AccountRegisterViewModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class AccountRegisterViewModel: ViewModel {
    var coordinator: Coordinator?
    
    init(coordinator: AccountCoordinator? = nil) {
        self.coordinator = coordinator
    }
}
