//
//  ProductDetailViewController.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import UIKit

class ProductDetailViewController: UIViewController {
    var viewModel = ProductDetailViewModel()
    private var rightBarButtonItem = UIBarButtonItem()
    private var nameLabel = UILabel()
    private var companyLabel = UILabel()
    private var priceLabel = UILabel()
    private var stackView = UIStackView()
    
    init(viewModel: ProductDetailViewModel) {
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
        rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.badge.plus"), style: .done, target: self, action: #selector(onAddToCartButtonClick))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.title = UIStringModel.ProductDetailNavigationItemTitle
        
        nameLabel.text = viewModel.product?.name
        companyLabel.text = viewModel.product?.company
        priceLabel.text = viewModel.product?.price.description
        
        stackView = UIStackView(arrangedSubviews: [nameLabel, companyLabel, priceLabel])
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
    
    @objc private func onAddToCartButtonClick() {
        guard let product = viewModel.product else { return }
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: UIStringModel.AddedToCart, preferredStyle: .alert)
            let okAction = UIAlertAction(title: UIStringModel.Ok, style: .default) { _ in
                self.viewModel.coordinator?.coordinator(onNext: .product(.addCart(product)))
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
}
