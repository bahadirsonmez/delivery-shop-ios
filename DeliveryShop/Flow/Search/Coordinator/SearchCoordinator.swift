//
//  WalletCoordinator.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

final class SearchCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: SearchViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 2
    }
    
    init(controller: SearchViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
