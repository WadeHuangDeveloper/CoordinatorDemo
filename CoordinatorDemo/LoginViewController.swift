//
//  LoginViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import UIKit

class LoginViewController: UIViewController {
    static let identifier = "LoginViewController"
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Login"
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        coordinator?.request(with: .toVerifyPage)
    }
}
