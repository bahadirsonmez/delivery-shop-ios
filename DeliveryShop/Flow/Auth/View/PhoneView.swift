//
//  PhoneView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 8.02.2021.
//
class PhoneView: BaseView {
    var continueTapped: ((String) -> Void)?
    lazy var topImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "phone")
        return iv
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.semibold24))
        label.text = "Start with phone".localized()
        return label
    }()
    lazy var subtitle: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular16))
        label.text = "Enter will get a code via SMS.\nOperator rates may apply.".localized()
        return label
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        return view
    }()
    lazy var phoneTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Phone")
        tf.keyboardType = .phonePad
        return tf
    }()
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.apply(style: .blueColor)
        button.setTitle("Continue".localized(), for: .normal)
        button.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside)
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
    @objc func labelTapped(gesture: UITapGestureRecognizer) {
        let text = "By signing up you agree to\nour Terms and Conditions of Use"
        let termsRange = (text as NSString).range(of: "Terms and Conditions of Use")
        if gesture.didTapAttributedTextInLabel(label: privacyLabel, inRange: termsRange) {
            print("Terms and Conditions of Use tapped")
        }
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
        phoneTextField.delegate = self
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
    }
}

extension PhoneView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(topImage, title,
                    subtitle, containerView)
        containerView.addSubviews(phoneTextField, continueButton, privacyLabel)
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
        phoneTextField.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 45)
        )
        continueButton.anchor(
            top: phoneTextField.bottomAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        privacyLabel.anchor(
            top: continueButton.bottomAnchor,
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

extension PhoneView: UITextFieldDelegate {
    @objc func continueButtonPressed(){
        if !checkTextField(phoneTextField, validationType: .phone) {
            return
        }
        if let phone = phoneTextField.text {
            self.continueTapped?(phone)
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 13
    }

}

