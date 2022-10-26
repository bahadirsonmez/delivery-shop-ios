//
//  BaseViewController.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit
import SwiftMessages
import Lottie

class BaseViewController: UIViewController, CoordinatorNavigationControllerDelegate {
    
    var onForceLogout: (() -> Void)?
    
    var activityIndicatorView: ActivityIndicatorView!
    var loadingView: LoadingView!
    var messageView = MessageView()
    var account = Account.sharedAccount.self

    //let analytics = AnalyticManager.sharedInstance
    // MARK: - Controller lifecycle
    
    let animationView = AnimationView()
    let progressHUD = LottieProgressHUD.shared
    
//    let minLineSpacing = Constants.BasicCell.minLineSpacing
//    let cellHeight = Constants.BasicCell.cellHeight
//    let headerHeight = Constants.BasicCell.headerHeight
//    let sectionInset = Constants.BasicCell.sectionInset
//    let sectionInsetZero = Constants.BasicCell.sectionInsetZero
//    let cellId = Constants.BasicCell.cellID
//    let headerId = Constants.BasicCell.headerID
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = self.navigationController as? CoordinatorNavigationController {
            navigationController.swipeBackDelegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Constants.Colors.backgroundColor
        self.setupNavigationController()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Private methods
    private func setupNavigationController() {
//        navigationController?.navigationBar.hideHairline()
    }
    
    // MARK: - SwipeBackNavigationControllerDelegate
    internal func transitionBackFinished() {}
    
    internal func didSelectCustomBackAction() {}
    
    func forceLogout(_ code: Int) {
        if code == 462 || code == 461 || code == 401 {
            self.onForceLogout?()
        }
    }
    
    func showActivityIndicator() {
//        progressHUD.animationFileName = "loader"
//        progressHUD.hudHeight = 200
//        progressHUD.hudWidth = 200
//        progressHUD.hudBackgroundColor = .blue
//        self.view.addSubview(progressHUD)
//        progressHUD.show()
        AlertManager.showAlertPleaseWait(self)
    }
    
    func stopActivityIndicator() {
        //progressHUD.hide()
        AlertManager.dismiss(self)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0 , width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func resizeImageForUpload(image: UIImage, size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
