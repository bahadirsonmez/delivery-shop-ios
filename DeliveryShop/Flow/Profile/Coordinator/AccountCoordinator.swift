//
//  AccountCoordinator.swift
//  bolomio
//
//  Created by ssaylanc on 13.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

final class AccountCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: AccountViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 4
        controller.onLogout = {
            self.removeDependency(self)
            self.showAuthFlow()
        }
    }

    private func showAuthFlow() {
        let authCoordinator = self.factory.instantiateAuthCoordinator(router: router)
        addDependency(authCoordinator)
        authCoordinator.start()
    }
    
    init(controller: AccountViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
