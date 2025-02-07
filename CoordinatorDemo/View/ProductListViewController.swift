//
//  ProductListViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import UIKit

class ProductListViewController: UIViewController {
    var viewModel = ProductListViewModel()
    private var leftBarButtonItem = UIBarButtonItem()
    private var profileBarButtonItem = UIBarButtonItem()
    private var cartBarButtonItem = UIBarButtonItem()
    private var tableView = UITableView()
    private let identifier = "identifier"
    
    init(viewModel: ProductListViewModel) {
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
        leftBarButtonItem = UIBarButtonItem(title: UIStringModel.Logout, style: .done, target: self, action: #selector(onLogoutButtonClick))
        profileBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(onProfileButtonClick))
        cartBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .done, target: self, action: #selector(onCartButtonClick))
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationItem.rightBarButtonItems = [profileBarButtonItem, cartBarButtonItem]
        navigationItem.title = UIStringModel.ProductListNavigationItemTitle
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func onLogoutButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .canceled)
    }
    
    @objc private func onProfileButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .user(.profile))
    }

    @objc private func onCartButtonClick() {
        let cartsProducts = viewModel.cartsProducts
        viewModel.coordinator?.coordinator(onNext: .product(.cart(cartsProducts)))
    }
}

extension ProductListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(viewModel.products[indexPath.row].name) $:\(viewModel.products[indexPath.row].price)"
        cell.detailTextLabel?.text = viewModel.products[indexPath.row].company
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
}

extension ProductListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.products[indexPath.row]
        viewModel.coordinator?.coordinator(onNext: .product(.detail(product)))
    }
}
