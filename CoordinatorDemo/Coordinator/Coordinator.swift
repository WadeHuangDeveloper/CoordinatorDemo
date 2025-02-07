//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/6.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var router: Router { get set }
    var childCoordinators: [any Coordinator] { get set }
    
    func start()
    func coordinator(onNext event: CoordinatorEvent)
}
