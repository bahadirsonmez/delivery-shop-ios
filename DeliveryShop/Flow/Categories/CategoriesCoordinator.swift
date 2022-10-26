//
//  CategoriesCoordinator.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

final class CategoriesCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
      
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: CategoriesViewController
    
    override func start() {
        showAccountModule()
    }
    
    // MARK: - Private metods
    private func showAccountModule() {
        controller.tabBarController?.selectedIndex = 1
        
        controller.onShowSubCategory = {
            self.showSubCategories()
        }
    }
    
    private func showSubCategories() {
        let vc = self.factory.instantiateSubcategoriesViewController()
        vc.onBack = {
            self.router.popModule()
        }
        self.router.push(vc, transition: FadeAnimator(animationDuration: 0.3,
                                                      isPresenting: true))
    }
    
    init(controller: CategoriesViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
