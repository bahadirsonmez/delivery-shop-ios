//
//  DependencyContainer.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit
import Alamofire

typealias Factory = CoordinatorFactoryProtocol & ViewControllerFactory
//typealias SubViewControllerFactory = AccountControllerFactory
typealias ViewControllerFactory = AuthViewControllerFactory & TabBarControllerFactory/* & SubViewControllerFactory& WalktroughViewControllerFactory*/

class DependencyContainer {
    
    // MARK: - Vars & Lets
    
    private var rootController: CoordinatorNavigationController
    
    // MARK: App Coordinator
    
    internal lazy var applicationCoordinator = self.instantiateApplicationCoordinator()
    
    
    // MARK: APi Manager
    
    lazy var sessionManager = Session(interceptor: APIManagerRetrier())
    //lazy var sessionManager = Session()
    lazy var retrier = APIManagerRetrier()
    
    // MARK: Network services

    lazy var loginManager = LoginAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var mainManager = MainAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var searchManager = SearchAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var basketManager = BasketAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var whislistManager = WhislistAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var campaignManager = CampaignsAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    lazy var accountManager = AccountAPIManager(sessionManager: self.sessionManager, retrier: self.retrier)
    
    // MARK: - Public func
    
    func start() {
        self.applicationCoordinator.start()
    }
    
    func reboot() {
        self.applicationCoordinator.start()
    }
    
    // MARK: - Initialization
    
    init(rootController: CoordinatorNavigationController) {
        self.rootController = rootController
        self.customizeNavigationController()
    }
    
    // MARK: - Private methods
    
    private func customizeNavigationController() {
        self.rootController.enableSwipeBack()
        self.rootController.customizeTitle(titleColor: Constants.Colors.mainTextColor,
                                           largeTextFont: Constants.Fonts.medium17,
                                           smallTextFont: Constants.Fonts.medium17,
                                           isTranslucent: true,
                                           barTintColor: Constants.Colors.backgroundColor)
        self.rootController.customizeBackButton(backButtonImage: UIImage(named: "Back Arrow"),
                                      backButtonTitle: "",
                                      backButtonfont: UIFont.systemFont(ofSize: 15, weight: .bold),
                                      backButtonTitleColor: .white,
                                      shouldUseViewControllerTitles: true)
    }
}

// MARK: - Extensions
// MARK: - CoordinatorFactoryProtocol

extension DependencyContainer: CoordinatorFactoryProtocol {
    func makeTabbarCoordinator(router: RouterProtocol) -> (coordinator: Coordinator, toPresent: Presentable?) {
        let controller = MainTabBarController()
        let coordinator = MainTabBarCoordinator(router: router, factory: self as Factory)
        return (coordinator, controller)
    }
    
    func instantiateApplicationCoordinator() -> ApplicationCoordinator {
        return ApplicationCoordinator(router: Router(rootController: rootController), factory: self as Factory, launchInstructor: LaunchInstructor.configure())
    }
    
    func instantiateTabBarCoordinator(router: RouterProtocol) -> MainTabBarCoordinator {
        return MainTabBarCoordinator(router: router, factory: self as Factory)
    }
    
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator {
        return AuthCoordinator(router: router, factory: self as Factory)
    }
    
    func instantiateMainCoordinator(router: RouterProtocol) -> MainCoordinator {
        return MainCoordinator(controller: MainViewController(), router: router, factory: self as Factory)
    }
    
    func instantiateCategoriesCoordinator(router: RouterProtocol) -> CategoriesCoordinator {
        return CategoriesCoordinator(controller: CategoriesViewController(), router: router, factory: self as Factory)
    }
    
    func instantiateSearchCoordinator(router: RouterProtocol) -> SearchCoordinator {
        return SearchCoordinator(controller: SearchViewController(), router: router, factory: self as Factory)
    }
    
    func instantiateBasketCoordinator(router: RouterProtocol) -> BasketCoordinator {
        return BasketCoordinator(controller: BasketViewController(), router: router, factory: self as Factory)
    }
    
    func instantiateCampaignsCoordinator(router: RouterProtocol) -> CampaignsCoordinator {
        return CampaignsCoordinator(controller: CampaignsViewController(), router: router, factory: self as Factory)
    }
    
    func instantiateAccountCoordinator(router: RouterProtocol) -> AccountCoordinator {
        return AccountCoordinator(controller: AccountViewController(), router: router, factory: self as Factory)
    }
    
    func makeCoordinators(routers: [RouterProtocol]) -> [Coordinator & CoordinatorFinishOutput] {
        if routers.count != 1 {
            return []
        }else {
            let mapCoordinator = instantiateCampaignsCoordinator(router: routers[0])
            
            return[mapCoordinator]
        }
    }
}
