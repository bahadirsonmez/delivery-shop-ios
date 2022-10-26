//
//  RegisterViewController.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class RegisterViewController: BaseViewController {
    var onBack: (() -> Void)?
    var onFinishRegister: ((Bool) -> Void)?
    var onLogin: (() -> Void)?

    var viewModel: LoginViewModel!
    private let thisView: RegisterView = RegisterView()

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
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
//        thisView.nameTextField.becomeFirstResponder()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationBarSetup()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }

    private func navigationBarSetup() {
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "info")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapInfo))
    }

    @objc func didTapInfo() { }

    private func bindViewModel() {
//        self.viewModel.isLoading = {(loading) in
//            if loading {
//                self.thisView.continueButton.loadingIndicator(true, color: .white)
//            }else {
//                self.thisView.continueButton.loadingIndicator(false, color: .white)
//            }
//        }
    }
    
    private func bindActions() {
        thisView.registerTapped = { [unowned self] (name, email, password) in
            self.registerAction(name: name, email: email, password: password)
        }
        thisView.loginTapped = {
            self.onLogin?()
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
    
    private func registerAction(name: String, email: String, password: String) {
//        self.viewModel.logiWithEmail(email, password: password) {
            self.onFinishRegister?(true)
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

