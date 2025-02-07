//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class AppCoordinator: Coordinator {
    var router: Router
    var childCoordinators: [Coordinator] {
        didSet {
            print("\(Self.self) count: \(childCoordinators.count)")
            childCoordinators.forEach { print($0.self) }
        }
    }
    
    init(router: Router, childCoordinators: [Coordinator] = []) {
        self.router = router
        self.childCoordinators = childCoordinators
    }
    
    private func startAccountCoordinator() {
        let coordinator = AccountCoordinator(router: router, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func startUserCoordinator() {
        let coordinator = UserCoordinator(router: router, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func startProductCoordinator() {
        let coordinator = ProductCoordinator(router: router, parentCoordinator: self)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
    
    private func removeCoordinator() {
        if childCoordinators.count > 1 {
            childCoordinators.removeLast()
        }
        if let lastCoordinator = childCoordinators.last {
            print("lastCoordinator: \(lastCoordinator.self)")
            lastCoordinator.start()
        } else {
            router.popToRootViewController(animated: true, completion: nil)
        }
    }
    
    func start() {
        startAccountCoordinator()
    }
    
    func coordinator(onNext event: CoordinatorEvent) {
        switch event {
        case .canceled, .finished, .failed:
            self.removeCoordinator()
        case .account(let accountCoordinatorEvent):
            if let coordinator = self.childCoordinators.first(where: { $0 is AccountCoordinator }) as? AccountCoordinator {
                coordinator.coordinator(onNext: .account(accountCoordinatorEvent))
            } else {
                self.startAccountCoordinator()
            }
        case .user(let userCoordinatorEvent):
            if let coordinator = self.childCoordinators.first(where: { $0 is UserCoordinator }) as? UserCoordinator {
                coordinator.coordinator(onNext: .user(userCoordinatorEvent))
            } else {
                self.startUserCoordinator()
            }
        case .product(let productCoordinatorEvent):
            if let coordinator = self.childCoordinators.first(where: { $0 is ProductCoordinator }) as? ProductCoordinator {
                coordinator.coordinator(onNext: .product(productCoordinatorEvent))
            } else {
                self.startProductCoordinator()
            }
        }
    }
}
