//
//  AccountRegisterVerifyViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import UIKit

class AccountRegisterVerifyViewController: UIViewController {
    var viewModel = AccountRegisterVerifyViewModel()
    private var leftBarButtonItem = UIBarButtonItem()
    private var rightBarButtonItem = UIBarButtonItem()
    
    init(viewModel: AccountRegisterVerifyViewModel) {
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
        leftBarButtonItem = UIBarButtonItem(title: UIStringModel.Cancel, style: .done, target: self, action: #selector(onCancelButtonClick))
        rightBarButtonItem = UIBarButtonItem(title: UIStringModel.Done, style: .done, target: self, action: #selector(onDoneButtonClick))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = UIStringModel.AccountRegisterVerifyNavigationItemTitle
        view.backgroundColor = .systemBackground
    }
    
    @objc private func onCancelButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .canceled)
    }

    @objc private func onDoneButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .finished)
    }
}
