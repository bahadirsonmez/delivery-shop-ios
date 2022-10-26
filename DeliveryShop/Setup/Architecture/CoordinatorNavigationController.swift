//
//  CoordinatorNavigationController.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

protocol CoordinatorNavigationControllerDelegate: class {
    func transitionBackFinished()
    func didSelectCustomBackAction()
}

class CoordinatorNavigationController: UINavigationController {

    // MARK: - Vars & Lets
    
    private var transition: UIViewControllerAnimatedTransitioning?
    private var shouldEnableSwipeBack = false
    fileprivate var duringPushAnimation = false
    
    // MARK: Back button customization
    
    private var backButtonImage: UIImage?
    private var backButtonTitle: String?
    private var backButtonfont: UIFont?
    private var backButtonTitleColor: UIColor?
    private var shouldUseViewControllerTitles = false
    
    // MARK: Delegates
    
    weak var swipeBackDelegate: CoordinatorNavigationControllerDelegate?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.tintColor = .black
        self.transitioningDelegate = self
        self.navigationBar.isTranslucent = true
//        self.navigationBar.barTintColor = .white
    }
    
    // MARK: - Public methods
    
    func setTransition(transition: UIViewControllerAnimatedTransitioning?) {
        if self.shouldEnableSwipeBack {
            self.enableSwipeBack()
        }
        
        self.transition = transition
        
        if transition != nil {
            self.disableSwipeBack()
        }
    }
    
    func customizeBackButton(backButtonImage: UIImage? = nil, backButtonTitle: String? = nil, backButtonfont: UIFont? = nil, backButtonTitleColor: UIColor? = nil, shouldUseViewControllerTitles: Bool = false) {
        self.backButtonImage = backButtonImage
        self.backButtonTitle = backButtonTitle
        self.backButtonfont = backButtonfont
        self.backButtonTitleColor = backButtonTitleColor
        self.shouldUseViewControllerTitles = shouldUseViewControllerTitles
    }
    
    func customizeTitle(titleColor: UIColor, largeTextFont: UIFont, smallTextFont: UIFont, isTranslucent: Bool = true, barTintColor: UIColor? = nil) {
        self.navigationBar.prefersLargeTitles = false
        UINavigationBar.customNavBarStyle(color: titleColor, largeTextFont: largeTextFont, smallTextFont: smallTextFont, isTranslucent: isTranslucent, barTintColor: barTintColor)
    }
    
    func enableSwipeBack() {
        self.shouldEnableSwipeBack = true
        self.interactivePopGestureRecognizer?.isEnabled = true
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    // MARK: - Private methods
    
    private func disableSwipeBack() {
        self.interactivePopGestureRecognizer?.isEnabled = false
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    private func setupCustomBackButton(viewController: UIViewController) {
        if self.backButtonImage != nil || self.backButtonTitle != nil {
            viewController.navigationItem.hidesBackButton = true
//            let backButtonTitle = self.shouldUseViewControllerTitles ? self.viewControllers[self.viewControllers.count - 2].title : self.backButtonTitle
            let button = CustomBackButton.initCustomBackButton(backButtonImage: self.backButtonImage, backButtonTitle: backButtonTitle, backButtonfont: self.backButtonfont, backButtonTitleColor: self.backButtonTitleColor)
            button.addTarget(self, action: #selector(actionBack(sender:)), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    private func hideBackButton(viewController: UIViewController) {
        if self.backButtonImage != nil || self.backButtonTitle != nil {
            viewController.navigationItem.hidesBackButton = true
            //            let backButtonTitle = self.shouldUseViewControllerTitles ? self.viewControllers[self.viewControllers.count - 2].title : self.backButtonTitle
            let button = CustomBackButton.initCustomBackButton(backButtonImage: nil, backButtonTitle: backButtonTitle, backButtonfont: self.backButtonfont, backButtonTitleColor: self.backButtonTitleColor)
            button.addTarget(self, action: #selector(actionBack(sender:)), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    // MARK: - Actions
    
    @objc private func actionBack(sender: UIBarButtonItem) {
        self.swipeBackDelegate?.didSelectCustomBackAction()
    }
    
    // MARK: - Overrides
    var backButtonHidden: Bool = false
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.duringPushAnimation = true
        super.pushViewController(viewController, animated: animated)
        if backButtonHidden == true {
            self.hideBackButton(viewController: viewController)
        }else {
            self.setupCustomBackButton(viewController: viewController)
        }
    }
    
    // MARK: - Initialization
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // iOS 11'de crash alıyoruz. Aşağıdaki kodu ekledik.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

// MARK: - Extensions
// MARK: - UIGestureRecognizerDelegate

extension CoordinatorNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == self.interactivePopGestureRecognizer else {
            return true
        }
                
        return self.viewControllers.count > 8 && self.duringPushAnimation == false
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

// MARK: - UINavigationControllerDelegate

extension CoordinatorNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let coordinator = navigationController.topViewController?.transitionCoordinator {
            coordinator.notifyWhenInteractionChanges { (context) in
                if !context.isCancelled {
                    self.swipeBackDelegate?.transitionBackFinished()
                }
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let swipeNavigationController = navigationController as? CoordinatorNavigationController else { return }
        swipeNavigationController.duringPushAnimation = false
    }
    
}

extension CoordinatorNavigationController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.transition
    }
}
