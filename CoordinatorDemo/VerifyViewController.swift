//
//  VerifyViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import UIKit

class VerifyViewController: UIViewController {
    static let identifier = "VerifyViewController"
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Verify"
    }
    
    @IBAction func didTapVerifyButton(_ sender: Any) {
        coordinator?.request(with: .toProductPage)
    }
}
