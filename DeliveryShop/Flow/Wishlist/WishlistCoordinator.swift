//
//  WishlistCoordinator.swift
//  DeliveryShop
//
//  Created by ssaylanc on 7.02.2021.
//

import UIKit

final class WishlistCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: WishlistViewController
    
    override func start() {
        showWishModule()
    }
    
    // MARK: - Private metods
    private func showWishModule() {
        controller.tabBarController?.selectedIndex = 3
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
    
    init(controller: WishlistViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
