//
//  ProductModel.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProductModel {
    var name: String = ""
    var company: String = ""
    var price: Int = 0
    
    init(name: String, company: String, price: Int) {
        self.name = name
        self.company = company
        self.price = price
    }
}
