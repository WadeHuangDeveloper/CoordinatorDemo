//
//  ProductViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import UIKit

class ProductViewController: UIViewController {
    static let identifier = "ProductViewController"
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Product"
    }
    
    @IBAction func didTapBuyButton(_ sender: Any) {
        coordinator?.request(with: .toPaymentPage)
    }
}
