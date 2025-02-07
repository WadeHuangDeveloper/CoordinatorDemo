//
//  Router.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import Foundation
import UIKit

protocol Router {
    var navigationController: UINavigationController { get set }
    func push(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool, completion: (() -> Void)?)
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func popToRootViewController(animated: Bool, completion: (() -> Void)?)
}
