//
//  OTPView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 8.02.2021.
//
class OTPView: BaseView, OTPDelegate {
    var doneTapped: ((String) -> Void)?
    var resendTapped: (() -> Void)?
    var code: String!
    var isCodeValid: Bool = false

    lazy var topImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "home")
        return iv
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.semibold24))
        label.text = "Verifications".localized()
        return label
    }()
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular16))
        label.text = "Enter the verification code to complete sign up".localized()
        return label
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    lazy var codeTextfieldView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
//    lazy var codeTextField: UITextField = {
//        let textField = UITextField()
//        textField.font = fonts.regular16
//        let color = UIColor(rgba: "#A1A4B2")
//        let placeholder = "Code"
//        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : color])
//        textField.textColor = colors.mainTextColor
//        textField.textAlignment = .left
//        textField.contentHorizontalAlignment = .center
//        textField.autocapitalizationType = .none
//        textField.autocorrectionType = .no
//        textField.keyboardType = .phonePad
//        return textField
//    }()
    lazy var codeTextField: OTPStackView = {
        let tf = OTPStackView()
        return tf
    }()
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.apply(style: .blueColor)
        button.setTitle("Done".localized(), for: .normal)
        button.addTarget(self, action: #selector(doneButtonPressed), for: .touchUpInside)
        return button
    }()

    lazy var reSendLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular16, textColor: colors.blueTextColor))
        label.text = "Resend Code".localized()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(resendButtonPressed))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelTap)
        return label
    }()


    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        codeTextField.delegate = self
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
    }
}

extension OTPView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(topImage, title,
                    subtitle, containerView)
        containerView.addSubviews(codeTextfieldView, doneButton, reSendLabel)
        codeTextfieldView.addSubview(codeTextField)
    }
    func setupConstraints() {
        let safeArea: UILayoutGuide = self.safeAreaLayoutGuide
        topImage.anchor(
            top: safeArea.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 40, left: 0, bottom: 0, right: 0),
            size: .init(width: 45, height: 45)
        )
        topImage.centerX(to: self)
        title.anchor(
            top: topImage.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 15, left: 0, bottom: 0, right: 0)
        )
        title.centerX(to: self)
        subtitle.anchor(
            top: title.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
        subtitle.centerX(to: self)
        containerView.anchor(
            top: subtitle.bottomAnchor,
            leading: safeArea.leadingAnchor,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 50, left: 12, bottom: 0, right: 12),
            size: .init(width: 0, height: 210)
        )
        codeTextfieldView.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 20, right: 0),
            size: .init(width: 0, height: 45)
        )
        codeTextField.anchor(
            top: codeTextfieldView.topAnchor,
            leading: codeTextfieldView.leadingAnchor,
            bottom: codeTextfieldView.bottomAnchor,
            trailing: codeTextfieldView.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        doneButton.anchor(
            top: codeTextfieldView.bottomAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        reSendLabel.anchor(
            top: doneButton.bottomAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )

    }

    func setupAdditionalConfiguration() {
        //        self.backgroundColor = UIColor(rgba: "#F9F9F9")
    }
}

extension OTPView {
    @objc func doneButtonPressed() {
        if isCodeValid {
            self.doneTapped?(code)
        } else {
            codeTextField.setAllFieldColor(isWarningColor: true, color: .red)
        }
//        if !checkTextField(codeTextField, validationType: .otpCode) {
//            return
//        }
//        if let code = codeTextField.text {
//            self.doneTapped?(code)
//        }
    }

    @objc func resendButtonPressed() {
        self.resendTapped?()
    }

    func didChangeValidity(isValid: Bool) {
        if isValid {
            code = codeTextField.getOTP()
        }
        isCodeValid = isValid
    }

}

