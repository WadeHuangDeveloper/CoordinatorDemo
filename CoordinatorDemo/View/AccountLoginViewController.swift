//
//  AccountLoginViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import UIKit

class AccountLoginViewController: UIViewController {
    var viewModel: AccountLoginViewModel
    private var loginButton = UIButton(type: .system)
    private var registerButton = UIButton(type: .system)
    
    init(viewModel: AccountLoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    private func initUI() {
        navigationItem.title = UIStringModel.AccountLoginNavigationItemTitle
        
        loginButton.addTarget(self, action: #selector(onLoginButtonClick), for: .touchUpInside)
        loginButton.setTitle(UIStringModel.Login, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        registerButton.addTarget(self, action: #selector(onRegisterButtonClick), for: .touchUpInside)
        registerButton.setTitle(UIStringModel.Register, for: .normal)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -20),
            loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    @objc private func onLoginButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .product(.list))
    }

    @objc private func onRegisterButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .account(.register))
    }
}
