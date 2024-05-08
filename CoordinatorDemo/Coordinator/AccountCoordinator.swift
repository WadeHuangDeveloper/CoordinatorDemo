//
//  AccountCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import Foundation
import UIKit

class AccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var navigationController: UINavigationController
    var children: [Coordinator]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.children = [Coordinator]()
    }
    
    func start() {
        request(with: .toLoginPage)
    }
    
    func request(with event: CoordinatorEvent) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch event {
        case .toLoginPage:
            let viewController = storyboard.instantiateViewController(withIdentifier: LoginViewController.identifier) as! LoginViewController
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        case .toVerifyPage:
            let viewController = storyboard.instantiateViewController(withIdentifier: VerifyViewController.identifier) as! VerifyViewController
            viewController.coordinator = self
            navigationController.pushViewController(viewController, animated: true)
        default:
            parentCoordinator?.request(with: .toProductPage)
        }
    }
}
