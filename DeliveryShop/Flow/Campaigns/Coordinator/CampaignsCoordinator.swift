//
//  CampaignsCoordinator.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

final class CampaignsCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: CampaignsViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 3
    }
    
    init(controller: CampaignsViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
