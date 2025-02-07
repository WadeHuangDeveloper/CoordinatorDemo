//
//  ProductCartViewModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProductCartViewModel: ViewModel {
    var coordinator: Coordinator?
    var products: [ProductModel] = []
    
    init(coordinator: ProductCoordinator? = nil, products: [ProductModel] = []) {
        self.coordinator = coordinator
        self.products = products
    }
}
