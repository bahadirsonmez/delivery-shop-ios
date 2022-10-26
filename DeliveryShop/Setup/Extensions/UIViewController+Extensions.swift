//
//  UIViewController+Extensions.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import SwiftMessages

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
     func showAlert(message:String) {
         let  alert = UIAlertController.init(title: nil,
                                             message: message,
                                             preferredStyle: .alert)
    
         alert.addAction(UIAlertAction.init(title: "OK",
                                            style: .cancel, handler: {_ in self .dismiss(animated: true, completion: nil)}))
         self.present(alert, animated: true, completion: nil)
     }
     
     func showErrorAlert(message:String) {
         let  alert = UIAlertController.init(title: "Go-Jek",
                                                message: message,
                                                preferredStyle: .alert)
       
         alert.addAction(UIAlertAction.init(title: "OK",
                                               style: .cancel, handler: {_ in  alert.dismiss(animated: true, completion: nil)}))
         self.present(alert, animated: true, completion: nil)
     }
    
    func showAlert(_ alert: AlertMessage) {
        let  alert = UIAlertController.init(title: alert.title,
                                            message: alert.body,
                                            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Tamam".localized(),
                                           style: .cancel, handler: {_ in self .dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}


extension UIViewController {
    /**
      returns true only if the viewcontroller is presented.
    */
    var isModal: Bool {
        if let index = navigationController?.viewControllers.firstIndex(of: self), index > 0 {
            return false
        } else if presentingViewController != nil {
            if let parent = parent, !(parent is UINavigationController || parent is UITabBarController) {
                return false
            }
            return true
        } else if let navController = navigationController, navController.presentingViewController?.presentedViewController == navController {
            return true
        } else if tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
}

extension UIViewController {
  func showAlert(title: String, msg: String)  {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
  }
}
