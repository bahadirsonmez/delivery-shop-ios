//
//  CoordinatorFactoryProtocol.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func instantiateApplicationCoordinator() -> ApplicationCoordinator
    func instantiateTabBarCoordinator(router: RouterProtocol) -> MainTabBarCoordinator
    
    func instantiateAuthCoordinator(router: RouterProtocol) -> AuthCoordinator
    func instantiateMainCoordinator(router: RouterProtocol) -> MainCoordinator
    func instantiateBasketCoordinator(router: RouterProtocol) -> BasketCoordinator
    func instantiateCampaignsCoordinator(router: RouterProtocol) -> CampaignsCoordinator
    func instantiateAccountCoordinator(router: RouterProtocol) -> AccountCoordinator
    
    func makeCoordinators(routers: [RouterProtocol]) -> [Coordinator & CoordinatorFinishOutput]
    
    func makeTabbarCoordinator(router: RouterProtocol) -> (coordinator: Coordinator, toPresent: Presentable?)
}
