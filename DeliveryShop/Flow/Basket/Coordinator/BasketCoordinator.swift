//
//  EventCoordinator.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

final class BasketCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    var finishFlow: (() -> Void)?
    
    private let router: RouterProtocol
    private let factory: Factory
    private let controller: BasketViewController
    
    override func start() {
        showModule()
    }
    
    // MARK: - Private metods
    private func showModule() {
        controller.tabBarController?.selectedIndex = 2
        controller.onCheckout = {
            self.showPayment()
        }
    }

    private func showPayment() {
        let vc = self.factory.instantiatePaymentViewController()
        vc.onBack = {
            self.router.popModule()
        }
        vc.onConfirmation = {
            self.showDelivery()
        }
        self.router.push(vc, transition: FadeAnimator(animationDuration: 0.3,
                                                      isPresenting: true))
    }

    private func showDelivery() {
        let vc = self.factory.instantiateDeliveryViewController()
        vc.onBack = {
            self.router.popModule()
        }
        vc.onPayment = {
            self.showDelivery()
        }
        self.router.push(vc, transition: FadeAnimator(animationDuration: 0.3,
                                                      isPresenting: true))
    }

    private func showConfirmation() {
        let vc = self.factory.instantiateConfirmationViewController()
        vc.onBack = {
            self.router.popModule()
        }
//        vc.onPlaceOrder = {
//            self.showDelivery()
//        }
        self.router.push(vc, transition: FadeAnimator(animationDuration: 0.3,
                                                      isPresenting: true))
    }

    init(controller: BasketViewController, router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
        self.controller = controller
    }
}
