//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2024/5/8.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator] { get set }
    
    func start()
    func request(with event: CoordinatorEvent)
}
