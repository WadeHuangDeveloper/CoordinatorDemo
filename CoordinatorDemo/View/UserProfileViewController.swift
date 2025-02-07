//
//  UserProfileViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import UIKit

class UserProfileViewController: UIViewController {
    var viewModel = UserProfileViewModel()
    private var leftBarButtonItem = UIBarButtonItem()
    private var rightBarButtonItem = UIBarButtonItem()
    private var nameLabel = UILabel()
    private var locationLabel = UILabel()
    private var emailLabel = UILabel()
    private var stackView = UIStackView()
    
    init(viewModel: UserProfileViewModel) {
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
        rightBarButtonItem = UIBarButtonItem(title: UIStringModel.Done, style: .done, target: self, action: #selector(onDoneButtonClick))
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = UIStringModel.UserProfileNavigationItemTitle
        
        nameLabel.text = viewModel.profile.name
        locationLabel.text = viewModel.profile.location
        emailLabel.text = viewModel.profile.email
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, locationLabel, emailLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }

    @objc private func onDoneButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .finished)
    }
}
