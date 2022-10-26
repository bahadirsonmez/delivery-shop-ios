//
//  PhoneViewController.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 8.02.2021.
//

class PhoneViewController: BaseViewController {
    var onBack: (() -> Void)?
    var onFinishPhoneAuth: ((Bool) -> Void)?
//    var onContinue: (() -> Void)?

    var viewModel: LoginViewModel!
    private let thisView: PhoneView = PhoneView()

    override func loadView() {
        super.loadView()
        self.view = thisView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.backgroundColor
        setupUI()
        bindViewModel()
        bindActions()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.isNavigationBarHidden = false
        thisView.phoneTextField.becomeFirstResponder()
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

    private func setupUI() {
        self.title = "Step 1"
    }

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
        thisView.continueTapped = { [unowned self] (phone) in
            phoneAuthAction(phone: phone)
//            self.onContinue?()
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

    private func phoneAuthAction(phone: String) {
//        self.viewModel.logiWithEmail(email, password: password) {
            self.onFinishPhoneAuth?(true)
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
