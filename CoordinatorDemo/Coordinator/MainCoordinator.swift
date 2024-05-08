//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator {
    var navigationController: UINavigationController
    var children: [Coordinator]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.children = [Coordinator]()
    }
    
    func start() {
        navigationController.delegate = self
        startAccountCoordinator()
    }
    
    func request(with event: CoordinatorEvent) {
        switch event {
        case .toLoginPage, .toVerifyPage:
            startAccountCoordinator()
        case .toPaymentPage, .toProductPage:
            startShopCoordinator()
        }
    }
    
    private func startAccountCoordinator() {
        let coordinator = AccountCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
     
    private func startShopCoordinator() {
        let coordinator = ShopCoorinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
    
    private func childCoordinatorDidFinish(_ coordinator: Coordinator) {
        for (index, childCoordinator) in children.enumerated() {
            if coordinator === childCoordinator {
                children.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // get from view controller when each view is presented
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        // pushing different view controller on top
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // popping that view is disappeared
        if let verifyViewController = fromViewController as? VerifyViewController {
            childCoordinatorDidFinish(verifyViewController.coordinator!)
        }
    }
}
