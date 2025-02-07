//
//  AccountCoordinator.swift
//  CoordinatorDemo
//
//  Created by Huei-Der Huang on 2025/2/7.
//

import Foundation

class AccountCoordinator: Coordinator {
    var router: Router
    var parentCoordinator: Coordinator
    var childCoordinators: [Coordinator]
    
    init(router: Router, parentCoordinator: Coordinator, childCoordinators: [Coordinator] = []) {
        self.router = router
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = childCoordinators
    }
    
    func start() {
        coordinator(onNext: .account(.login))
    }
    
    func coordinator(onNext event: CoordinatorEvent) {
        switch event {
        case .account(let accountCoordinatorEvent):
            switch accountCoordinatorEvent {
            case .login:
                if router.navigationController.viewControllers.contains(where: { $0 is AccountLoginViewController }) {
                    router.popToRootViewController(animated: true, completion: nil)
                } else {
                    let viewModel = AccountLoginViewModel(coordinator: self)
                    let viewController = AccountLoginViewController(viewModel: viewModel)
                    router.push(viewController, animated: true, completion: nil)
                }
            case .register:
                let viewModel = AccountRegisterViewModel(coordinator: self)
                let viewController = AccountRegisterViewController(viewModel: viewModel)
                router.push(viewController, animated: true, completion: nil)
            case .registerVerify:
                let viewModel = AccountRegisterVerifyViewModel(coordinator: self)
                let viewController = AccountRegisterVerifyViewController(viewModel: viewModel)
                router.push(viewController, animated: true, completion: nil)
            }
        default:
            parentCoordinator.coordinator(onNext: event)
        }
    }
}
