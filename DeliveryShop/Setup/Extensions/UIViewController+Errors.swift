//
//  UIViewController+Errors.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit
import SwiftMessages
import Alamofire

enum Module {
    case login
    case sms
    case register
    case map
    case account
    case payment
}

extension BaseViewController {
    
    func handleError(_ error: APIError) {
        // code == 462 || code == 461 -> Logout user
        if error.code != -2 {
            self.forceLogout(error.code)
            // code == 403 user is not Approved show alert
            if error.code == 403 {
                //self.showAlert("Uyarı".localized(), body: "Hizmeti kullanabilmek için üyeliğiniz onaylanmış olmalıdır.".localized())
                self.showAlert("Uyarı".localized(), body: "\(error.code): \(error.message)")
            }else if error.code != 401 {
                self.showAlert("Uyarı".localized(), body: "\(error.code) : \(error.message)")
            }
        }
    }
    
    func handleError(_ error: SkyErrorModel) {
        // code == 403 || code == 462 || code == 461 -> Logout user
//        if let errorCode = error.getCode(), let message = error.getMessage() {
//            self.forceLogout(errorCode)
//            self.showAlert("Uyarı".localized(), body: "\(errorCode) : \(message)")
//        }
    }
    
    func handleError(_ error: Error, module: Module) {
        let errorCode   = (error as NSError).code
        //let finalCode  = data.response?.statusCode ?? errorCode
        let code = error.asAFError?.responseCode ?? errorCode
        let error = ServiceError(code: code)
        switch error{
        case .serverConnectionError:
            switch module {
            default:
                self.showAlert("Uyarı".localized(), body: error.description)
            }
        case .notFound:
            switch module {
            case .login:
                self.showAlert("Uyarı".localized(), body: "Kullanıcı sistemde kayıtlı değil".localized())
            //self.showAlert(title: "Uyarı".localized(), msg: "Kullanıcı sistemde kayıtlı değil".localized())
            case .register:
                print("TODO")
            case .sms:
                print("TODO")
            case .map:
                self.showAlert("Uyarı".localized(), body: "Aranan veri bulunamadı.".localized())
            case .account:
                self.showAlert("Uyarı".localized(), body: "Üyeliğinizi tamamlamanız gerekiyor".localized())
            case .payment:
                print("TODO")
            }
        case .invalidRequest: break
            
        case .noAuthorized: break
            
        case .badGateway:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert("Uyarı".localized(), body: "Sisteme ulaşılamıyor!".localized())
            }
        case .timeOut: break
            
        case .notMapped: break
            
        case .noInternet: break
            
        case .requestTimeOut: break
            
        case .softwareConnectionError: break
            
        case .unauth:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert("Uyarı".localized(), body: "Tekrar login olmalısınız!".localized())
            }
        case .unknown: break
            
        case .internalServerError:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert( "Uyarı".localized(), body: "Sunucu hatası!".localized())
            }
        case .existingUser:
            switch module {
            case .login:
                self.showAlert("Uyarı".localized(), body: "Token eksik".localized())
            case .register:
                self.showAlert("Uyarı".localized(), body: "Kullanıcı sistemde kayıtlı".localized())
            case .sms:
                print("TODO")
            case .map:
                print("TODO")
            case .account:
                print("TODO")
            case .payment:
                print("TODO")
            }
        case .userNotFound:
            switch module {
            case .login:
                self.showAlert("Uyarı".localized(), body: "Kullanıcı kaydı bulunamadı".localized())
            case .register:
                self.showAlert("Uyarı".localized(), body: "Kullanıcı sistemde kayıtlı".localized())
            case .sms:
                print("TODO")
            case .map:
                print("TODO")
            case .account:
                print("TODO")
            case .payment:
                print("TODO")
            }
        case .cannotProcessData:
            print("TODO")
        case .dataExist:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert( "Uyarı".localized(), body: "TC no sistemde kayıtlı".localized())
            }
        case .mernisError:
            switch module {
            case .register:
                self.showAlert( "Uyarı".localized(), body: "Bilgilerinizde hata var.".localized())
            default:
                self.showAlert( "Uyarı".localized(), body: "Hata kodu: 4001".localized())
            }
        case .serverError:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert( "Uyarı".localized(), body: "Sunucuya ulaşılamıyor!".localized())
            }
        case .test:
            switch module {
            case .login, .register, .sms, .map, .account, .payment:
                self.showAlert( "Uyarı".localized(), body: "İnternet bağlantınız yok!".localized())
            }
        case .notValid:
            switch module {
            case .login, .register:
                self.showAlert( "Uyarı".localized(), body: "SMS kodunu hatalı girdiniz!".localized())
            default:
                self.showAlert( "Uyarı".localized(), body: "Girilen bilgi hatalı!".localized())
            }
        case .noRecord:
            break
        case .mernisMismatch, .mernisRegFields, .registerUploadFail:
            switch module {
            default:
                self.showAlert( "Uyarı".localized(), body: error.description)
            }
        }
        
    }
}

extension UIViewController {
    func showSuccess(_ title: String, body: String) {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.success)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 3.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showAlert(_ title: String, body: String)  {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .bottom
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 3)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    
    func showCustomAlert(_ title: String, body: String, position: SwiftMessages.PresentationStyle, duration: SwiftMessages.Duration) {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            messageView.configureTheme(.info)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            infoConfig.presentationStyle = position
            infoConfig.duration = duration
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showCenterAlert(_ title: String, body: String)  {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .center
            }
            infoConfig.duration = .seconds(seconds: 2.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showAlertBottom(_ title: String, body: String)  {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .bottom
            }else {
                infoConfig.presentationStyle = .bottom
            }
            infoConfig.duration = .seconds(seconds: 2.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showAlert(_ detail: String) {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: "Dikkat".localized(), body: detail)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 5.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showAlert(_ model: ErrorModel) {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: model.title, body: model.detail)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 1.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showCritical(_ title: String, body: String)  {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 10.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showInfo(_ title: String, body: String) {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.info)
            messageView.configureDropShadow()
            messageView.button?.isHidden = true
            messageView.configureContent(title: title, body: body)
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 1.0)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
    
    func showButtonAlert(_ title: String, body: String)  {
        DispatchQueue.main.async {
            var messageView = MessageView()
            messageView = MessageView.viewFromNib(layout: .cardView)
            
            messageView.configureTheme(.error)
            messageView.configureDropShadow()
            messageView.button?.isHidden = false
            messageView.configureContent(title: title, body: body)
            messageView.button?.setTitle("Giriş".localized(), for: .normal)
            messageView.buttonTapHandler = { _ in
                SwiftMessages.hide()
            }
            var infoConfig = SwiftMessages.defaultConfig
            if self.isModal {
                infoConfig.presentationStyle = .center
            }else {
                infoConfig.presentationStyle = .top
            }
            infoConfig.duration = .seconds(seconds: 0.8)
            SwiftMessages.show(config: infoConfig, view: messageView)
        }
    }
}
