//
//  MainTabBarCoordinator.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

final class MainTabBarCoordinator: BaseCoordinator, CoordinatorFinishOutput{
    
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?

    // MARK: - Vars & Lets
    private let router: RouterProtocol
    private let factory: Factory
    private var tabBarController: MainTabBarController?
    private var tabBarCoordinator: BaseCoordinator?
    
    // MARK: - Puplic methods
    override func start() {
        setupTabBarController()
    }
    
    // MARK: - Private methods
    
    private func setupTabBarController() {
        let tabBarController = factory.instantiateTabBarController()
        let mainController = factory.instantiateMainViewController()
        let categoriesController = factory.instantiateCategoriesViewController()
        //let searchController = factory.instantiateSearchViewController()
        let basketController = factory.instantiateBasketViewController()
        let wishlistController = factory.instantiateWishlistViewController()
        //let campaignsController = factory.instantiateCampaignsViewController()
        //let donationsController = factory.instantiateDonationsViewController()
        let accountController = factory.instantiateAccountViewController()
        
        tabBarController.viewControllers = [
            mainController,
            categoriesController,
            basketController,
            wishlistController,
            accountController
        ]
        
        tabBarController.toMain = {[weak self] in
            self?.showNextModule(mainController)
        }
        tabBarController.toCategories = {[weak self] in
            self?.showNextModule(categoriesController)
        }
        tabBarController.toBasket = {[weak self] in
            self?.showNextModule(basketController)
        }
        tabBarController.toWishList = {[weak self] in
            self?.showNextModule(wishlistController)
        }
        tabBarController.toAccount = {[weak self] in
            self?.showNextModule(accountController)
        }
        
        addFirstModule(mainController)
        
        router.setRootModule(tabBarController, hideBar: false, animated: false)
        self.tabBarController = tabBarController
        
    }
    
    private func addFirstModule(_ controller: MainViewController) {
        tabBarCoordinator = MainCoordinator(controller: controller, router: router, factory: factory)
        tabBarCoordinator?.start()
    }
    
    private func showNextModule(_ controller: UIViewController) {
        switch controller {
        case controller as MainViewController:
            tabBarCoordinator = MainCoordinator(controller: controller as! MainViewController, router: router, factory: factory)
        case controller as CategoriesViewController:
            tabBarCoordinator = CategoriesCoordinator(controller: controller as! CategoriesViewController, router: router, factory: factory)
        case controller as BasketViewController:
            tabBarCoordinator = BasketCoordinator(controller: controller as! BasketViewController, router: router, factory: factory)
        case controller as WishlistViewController:
            tabBarCoordinator = WishlistCoordinator(controller: controller as! WishlistViewController, router: router, factory: factory)
        case controller as AccountViewController:
            tabBarCoordinator = AccountCoordinator(controller: controller as! AccountViewController, router: router, factory: factory)
        default:
            break
        }
        tabBarCoordinator?.start()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
    private func setCoordinators(_ coordinators: [ Coordinator & CoordinatorFinishOutput]) {
        coordinators.forEach {[unowned self](coordinator) in
            var coordinator = coordinator
            coordinator.finishFlow = {  [unowned self, unowned coordinator] in
                self.removeDependency(coordinator)
                self.start()
            }
            coordinator.start()
        }
    }
}
