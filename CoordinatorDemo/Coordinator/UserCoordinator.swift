//
//  UserCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class UserCoordinator: Coordinator {
    var router: Router
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator]
    
    init(router: Router, parentCoordinator: Coordinator, childCoordinators: [Coordinator] = []) {
        self.router = router
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = childCoordinators
    }
    
    func start() {
        coordinator(onNext: .user(.profile))
    }
    
    func coordinator(onNext event: CoordinatorEvent) {
        switch event {
        case .user(let userCoordinatorEvent):
            switch userCoordinatorEvent {
            case .profile:
                let viewModel = UserProfileViewModel(coordinator: self)
                let viewController = UserProfileViewController(viewModel: viewModel)
                router.push(viewController, animated: true, completion: nil)
            }
        default:
            parentCoordinator.coordinator(onNext: event)
        }
    }
}
