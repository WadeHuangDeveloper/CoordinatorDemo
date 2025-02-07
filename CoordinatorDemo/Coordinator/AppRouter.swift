//
//  AppRouter.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation
import UIKit

class AppRouter: Router {
    static let shared = AppRouter()
    
    var navigationController: UINavigationController
    
    private init() {
        self.navigationController = UINavigationController()
    }
    
    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController.pushViewController(viewController, animated: animated)
            CATransaction.commit()
        }
    }
    
    func pop(animated: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController.popViewController(animated: animated)
            CATransaction.commit()
        }
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController.popToViewController(viewController, animated: animated)
            CATransaction.commit()
        }
    }
    
    func popToRootViewController(animated: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion)
            self.navigationController.popToRootViewController(animated: animated)
            CATransaction.commit()
        }
    }
}
