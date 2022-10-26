//
//  LoginViewController.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class LoginViewController: BaseViewController {
    var onBack: (() -> Void)?
    var onFinishLogin: ((Bool) -> Void)?
    var onContinue: (() -> Void)?
    var onRegister: (() -> Void)?
    
    var viewModel: LoginViewModel!
    private let thisView: LoginView = LoginView()

    override func loadView() {
        super.loadView()
        self.view = thisView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.backgroundColor
        bindViewModel()
        bindActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }


    private func bindViewModel() {
//        self.viewModel.isLoading = {(loading) in
//            if loading {
//                self.loginView.loginButton.loadingIndicator(true, color: .white)
//            }else {
//                self.loginView.loginButton.loadingIndicator(false, color: .white)
//            }
//        }
    }
    
    private func bindActions() {
        thisView.loginTapped = { [weak self] (email, password) in
            guard let self = self else {return}
            self.thisView.loginButton.loadingIndicator(false, color: .white)
            self.loginAction(email: email, password: password)
        }
        
        thisView.forgetTapped = { [weak self] email in
            guard let self = self else {return}
            self.forgetPassword(email)
        }
        thisView.continueTapped = { [unowned self] in
            self.onContinue?()
        }
        thisView.registerTapped = { [unowned self] in
            self.onRegister?()
        }


    }
    
    private func forgetPassword(_ email: String) {
//        viewModel.passwordReset(email) {
//            let alert = UIAlertController(title: "İşlem Başarılı", message: "Şifre sıfırlamak için email gönderildi.", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
//            self.present(alert, animated: true)
//        } failure: { (error) in
//            self.handleError(error)
//        }
    }
    
    private func loginAction(email: String, password: String) {
//        self.viewModel.logiWithEmail(email, password: password) {
            self.onFinishLogin?(true)
//        } failure: { (error) in
//            self.handleError(error)
//        }

//        self.viewModel.tokenMFA(username: phone, password: deviceId, success: { [weak self] in
//            DispatchQueue.main.async {
//                self!.loginView.continueButton.loadingIndicator(false, color: .white)
//                self?.onLogin?(phone, (self?.viewModel.timeoutDuration)!)
//            }
//        }) {(error) in
//            DispatchQueue.main.async {
//                self.handleError(error)
//                self.loginView.continueButton.loadingIndicator(false, color: .white)
//            }
//        }
    }
    
    override func didSelectCustomBackAction() {
        self.onBack?()
    }
    
    init(with viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
