//
//  ProductCartViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import UIKit

class ProductCartViewController: UIViewController {
    var viewModel = ProductCartViewModel()
    private var leftBarButtonItem = UIBarButtonItem()
    private var rightBarButtonItem = UIBarButtonItem()
    private var tableView = UITableView()
    private let identifier = "identifier"
    
    init(viewModel: ProductCartViewModel) {
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
        navigationItem.title = UIStringModel.ProductCartNavigationItemTitle
        
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

    @objc private func onDoneButtonClick() {
        viewModel.coordinator?.coordinator(onNext: .product(.list))
    }
}

extension ProductCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(viewModel.products[indexPath.row].name) $:\(viewModel.products[indexPath.row].price)"
        cell.detailTextLabel?.text = viewModel.products[indexPath.row].company
        cell.selectionStyle = .none
        return cell
    }
}

extension ProductCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

