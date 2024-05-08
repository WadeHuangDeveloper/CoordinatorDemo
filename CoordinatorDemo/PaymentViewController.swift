//
//  PaymentViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import UIKit

class PaymentViewController: UIViewController {
    static let identifier = "PaymentViewController"
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Payment"
    }
    
    @IBAction func didTapPayButton(_ sender: Any) {
        print("Pay succeeded")
    }
}
