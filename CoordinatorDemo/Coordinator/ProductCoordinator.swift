//
//  ProductCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class ProductCoordinator: Coordinator {
    var router: Router
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator]
    
    init(router: Router, parentCoordinator: Coordinator, childCoordinators: [Coordinator] = []) {
        self.router = router
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = childCoordinators
    }
    
    func start() {
        coordinator(onNext: .product(.list))
    }
    
    func coordinator(onNext event: CoordinatorEvent) {
        switch event {
        case .product(let productCoordinatorEvent):
            switch productCoordinatorEvent {
            case .list:
                if let viewController = router.navigationController.viewControllers.first(where: { $0 is ProductListViewController }) as? ProductListViewController {
                    router.popToViewController(viewController, animated: true, completion: nil)
                } else {
                    let viewModel = ProductListViewModel(coordinator: self)
                    let viewController = ProductListViewController(viewModel: viewModel)
                    router.push(viewController, animated: true, completion: nil)
                }
            case .detail(let product):
                let viewModel = ProductDetailViewModel(coordinator: self, product: product)
                let viewController = ProductDetailViewController(viewModel: viewModel)
                router.push(viewController, animated: true, completion: nil)
            case .cart(let products):
                let viewModel = ProductCartViewModel(coordinator: self, products: products)
                let viewController = ProductCartViewController(viewModel: viewModel)
                router.push(viewController, animated: true, completion: nil)
            case .addCart(let product):
                if let viewController = router.navigationController.viewControllers.first(where: { $0 is ProductListViewController }) as? ProductListViewController {
                    viewController.viewModel.cartsProducts.append(product)
                    router.popToViewController(viewController, animated: true, completion: nil)
                } else {
                    let viewModel = ProductListViewModel(coordinator: self)
                    let viewController = ProductListViewController(viewModel: viewModel)
                    router.push(viewController, animated: true, completion: nil)
                }
            }
        default:
            parentCoordinator.coordinator(onNext: event)
        }
    }
}
