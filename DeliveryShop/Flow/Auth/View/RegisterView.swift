//
//  RegisterView.swift
//  Walker Swift
//
//  Created by Bahadir Sonmez on 9.01.2021.
//
import UIKit

class RegisterView: BaseView {
    var registerTapped : ((String, String, String) -> Void)?
    var loginTapped: (() -> Void)?
    var privacyTapped : (() -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.semibold24, textColor: colors.mainTextColor))
        label.text = "Sign Up"
        return label
    }()
    lazy var formContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    lazy var nameTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Full Name")
        return tf
    }()
    lazy var emailTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Email")
        return tf
    }()
    lazy var passwordTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.rightViewMode = .always
        tf.loadView(placeholder: "Password", isSecureText: true,
                    rightViewImage: UIImage(named: "show-password")!)
        return tf
    }()
    lazy var confirmPasswordTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.rightViewMode = .always
        tf.loadView(placeholder: "Confirm Password", isSecureText: true,
                    rightViewImage: UIImage(named: "show-password")!)
        return tf
    }()
    lazy var showPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show-password"), for: .normal)
        button.addTarget(self, action: #selector(didTapShowPassword), for: .touchUpInside)
        return button
    }()
    lazy var showConfirmPasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "show-password"), for: .normal)
        button.addTarget(self, action: #selector(didTapShowConfirmPassword), for: .touchUpInside)
        return button
    }()
    lazy var privacyLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular16, numberOfLines: 0, textColor: colors.mainTextColor))
        let text = "By signing up you agree to\nour Terms and Conditions of Use"
        label.text = text
        let attrString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Terms and Conditions of Use")
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: colors.blueTextColor, range: range1)
        label.attributedText = attrString
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(labelTapped(gesture:))))
        return label
    }()
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.apply(style: .blueColor)
        button.setTitle("Create an Account".localized(), for: .normal)
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        return button
    }()
    lazy var socialMediaStackView: SocialMediaStackView = {
        let sv = SocialMediaStackView()
        sv.loadView(title: "Or sign up with social networks")
        return sv
    }()
    lazy var alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton()
        button.apply(style: .grayColor)
        button.setTitle("I have an account".localized(), for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
        self.textFieldSetup()
        self.socialMediaStackViewSetup()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(titleLabel ,formContainerView, socialMediaStackView, alreadyHaveAnAccountButton)
        formContainerView.addSubviews(
            nameTextField,
            emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            registerButton,
            privacyLabel)
    }

    func setupConstraints() {
        let safeArea: UILayoutGuide = self.safeAreaLayoutGuide
        titleLabel.anchor(
            top: safeArea.topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 15, left: 20, bottom: 0, right: 20)
        )
        formContainerView.anchor(
            top: titleLabel.bottomAnchor,
            leading: safeArea.leadingAnchor,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 20, left: 12, bottom: 0, right: 12),
            size: .init(width: 0, height: 460)
        )
        nameTextField.anchor(
            top: formContainerView.topAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 45)
        )
        emailTextField.anchor(
            top: nameTextField.bottomAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        passwordTextField.anchor(
            top: emailTextField.bottomAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 45)
        )
        confirmPasswordTextField.anchor(
            top: passwordTextField.bottomAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 45)
        )
        registerButton.anchor(
            top: confirmPasswordTextField.bottomAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        privacyLabel.anchor(
            top: registerButton.bottomAnchor,
            leading: formContainerView.leadingAnchor,
            bottom: nil,
            trailing: formContainerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
        socialMediaStackView.anchor(
            top: nil,
            leading: leadingAnchor,
            bottom: alreadyHaveAnAccountButton.topAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 32, bottom: 40, right: 32),
            size: .init(width: 0, height: 90)
        )
        alreadyHaveAnAccountButton.anchor(
            top: nil,
            leading: leadingAnchor,
            bottom: safeArea.bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 32, bottom: 10, right: 32),
            size: .init(width: 0, height: 45)
        )
    }

    func setupAdditionalConfiguration() {
    }
}

extension RegisterView {
    @objc func registerButtonPressed(){
        if !checkTextField(nameTextField, validationType: .name) ||
           !checkTextField(emailTextField, validationType: .email) ||
           !checkTextField(passwordTextField, validationType: .password) {
            return
        }
        if passwordTextField.text != confirmPasswordTextField.text {
            confirmPasswordTextField.shake()
            confirmPasswordTextField.text = ""
            confirmPasswordTextField.attributedPlaceholder = NSAttributedString.init(string: "Lütfen parolayı doğru giriniz".localized(), attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
            return
        }
        if let name = nameTextField.text,let email = emailTextField.text, let password = passwordTextField.text {
            self.registerTapped?(name, email, password)
        }
    }
    @objc func loginButtonPressed(){
        self.loginTapped?()
    }

    @objc func privacyButtonPressed(){
        self.privacyTapped?()
    }
    private func textFieldSetup() {
        passwordTextField.rightView = showPasswordButton
        confirmPasswordTextField.rightView = showConfirmPasswordButton
        emailTextField.textFieldChanged = { [unowned self](text) in
            if text.isValidEmail {
                self.emailTextField.rightViewMode = .always
                let imageview = UIImageView(frame: .init(x: 0, y: 0, width: 20, height: 20))
                imageview.image = UIImage(named: "check")
                imageview.contentMode = .right
                self.emailTextField.rightView = imageview
            } else {
                self.emailTextField.rightViewMode = .never
            }
        }
    }
    private func socialMediaStackViewSetup() {
        socialMediaStackView.twitterTapped = {
            print("Twitter Button Tapped")
        }
        socialMediaStackView.googleTapped = {
            print("Google Button Tapped")
        }
        socialMediaStackView.facebookTapped = {
            print("Facebook Button Tapped")
        }
    }
    @objc func didTapShowPassword() {
        if passwordTextField.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(named: "hide-password"), for: .normal)
        } else {
            showPasswordButton.setImage(UIImage(named: "show-password"), for: .normal)
        }
        passwordTextField.isSecureTextEntry.toggle()
    }

    @objc func didTapShowConfirmPassword() {
        if confirmPasswordTextField.isSecureTextEntry {
            showConfirmPasswordButton.setImage(UIImage(named: "hide-password"), for: .normal)
        } else {
            showConfirmPasswordButton.setImage(UIImage(named: "show-password"), for: .normal)
        }
        confirmPasswordTextField.isSecureTextEntry.toggle()
    }

    @objc func labelTapped(gesture: UITapGestureRecognizer) {
        let text = "By signing up you agree to\nour Terms and Conditions of Use"
        let termsRange = (text as NSString).range(of: "Terms and Conditions of Use")
        if gesture.didTapAttributedTextInLabel(label: privacyLabel, inRange: termsRange) {
            print("Terms and Conditions of Use tapped")
        }
    }
}
