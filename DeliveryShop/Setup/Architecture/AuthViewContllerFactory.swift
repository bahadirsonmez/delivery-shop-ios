//
//  AuthViewContllerFactory.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

protocol AuthViewControllerFactory {
    func instantiateOnboardingViewController() -> OnboardingViewController
    func instantiateWelcomeViewController() -> WelcomeViewController
    func instantiateLoginViewController() -> LoginViewController
    func instantiateRegisterViewController() -> RegisterViewController
    func instantiatePhoneViewController() -> PhoneViewController
    func instantiateOTPViewController() -> OTPViewController

}

//protocol WalktroughViewControllerFactory {
//    func instantiateWalktroughViewController() -> WalktroughViewController
//}

protocol TabBarControllerFactory {
    func instantiateTabBarController() -> MainTabBarController
    func instantiateMainViewController() -> MainViewController
    func instantiateCategoriesViewController() -> CategoriesViewController
    func instantiateSubcategoriesViewController() -> SubcategoriesViewController
    func instantiateSearchViewController() -> SearchViewController
    func instantiateBasketViewController() -> BasketViewController
    func instantiatePaymentViewController() -> PaymentViewController
    func instantiateDeliveryViewController() -> DeliveryViewController
    func instantiateConfirmationViewController() -> ConfirmationViewController
    func instantiateWishlistViewController() -> WishlistViewController
    func instantiateCampaignsViewController() -> CampaignsViewController
    func instantiateAccountViewController() -> AccountViewController
}

//protocol AccountControllerFactory {
//    func instantiateProfileViewController() -> UserAccountViewController
//}


