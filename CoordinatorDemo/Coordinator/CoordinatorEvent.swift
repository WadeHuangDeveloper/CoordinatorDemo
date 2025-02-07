//
//  CoordinatorEvent.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

enum CoordinatorEvent {
    case canceled
    case finished
    case failed(Error?)
    case account(AccountCoordinatorEvent)
    case user(UserCoordinatorEvent)
    case product(ProductCoordinatorEvent)
}

enum AccountCoordinatorEvent {
    case login
    case register
    case registerVerify
}

enum UserCoordinatorEvent {
    case profile
}

enum ProductCoordinatorEvent {
    case list
    case detail(ProductModel)
    case cart([ProductModel])
    case addCart(ProductModel)
}
