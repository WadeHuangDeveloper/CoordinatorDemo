//
//  ProductListViewModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProductListViewModel: ViewModel {
    var coordinator: Coordinator?
    var products: [ProductModel] = [ProductModel(name: "MacBook Pro M3", company: "Apple", price: 1299),
                                    ProductModel(name: "iPhone 16 Pro", company: "Apple", price: 699),
                                    ProductModel(name: "iPad mini 10", company: "Apple", price: 399)]
    var cartsProducts: [ProductModel] = []
    
    init(coordinator: ProductCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    func addCart(_ product: ProductModel) {
        if !cartsProducts.contains(where: { $0.name == product.name }) {
            cartsProducts.insert(product, at: 0)
        }
    }
    
    func removeCart(_ product: ProductModel) {
        if let index = cartsProducts.firstIndex(where: { $0.name == product.name }) {
            cartsProducts.remove(at: index)
        }
    }
}
