//
//  ShopCoorinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import Foundation
import UIKit

class ShopCoorinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController
    var children: [Coordinator]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.children = [Coordinator]()
    }
    
    func start() {
        request(with: .toProductPage)
    }
    
    func request(with event: CoordinatorEvent) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch event {
        case .toProductPage:
            let viewController = storyboard.instantiateViewController(withIdentifier: ProductViewController.identifier) as! ProductViewController
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        case .toPaymentPage:
            let viewController = storyboard.instantiateViewController(withIdentifier: PaymentViewController.identifier) as! PaymentViewController
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        default:
            parentCoordinator?.request(with: .toLoginPage)
        }
    }
}
