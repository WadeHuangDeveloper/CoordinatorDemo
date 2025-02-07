//
//  ProductDetailViewModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProductDetailViewModel: ViewModel {
    var coordinator: Coordinator?
    var product: ProductModel?
    
    init(coordinator: ProductCoordinator? = nil, product: ProductModel? = nil) {
        self.coordinator = coordinator
        self.product = product
    }
}
