//
//  AddCreditCardView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 12.02.2021.
//
import UIKit

class AddCreditCardSection: BaseCell, SetupCodeView {

    lazy var collectionView = AddCreditCardView()

    override func setupViews() {
        setupView()
    }
    func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    func setupConstraints() {
        collectionView.fillSuperview()
    }

    func setupAdditionalConfiguration() {
    }
}

class AddCreditCardView: BaseView {
    private let spacing:CGFloat = 12.0

    var safeArea = UILayoutGuide()

    var addTapped: ((String, String, String, String) -> Void)?
    var cardHolderChanged: ((String) -> Void)?
    var cardNumberChanged: ((String) -> Void)?
    var expiryChanged: ((String) -> Void)?
    var cvvChanged: ((String) -> Void)?

    lazy var cardHoldernameTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Card Holder")
        tf.textFieldChanged = { text in
            self.cardHolderChanged?(text)
        }
        return tf
    }()
    lazy var cardNumberTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Card Number")
        tf.keyboardType = .numberPad
        tf.textFieldChanged = { text in
            self.cardNumberChanged?(text)
        }
        return tf
    }()
    lazy var expiryTextField: HamurTextField = {
        let tf = HamurTextField()
//        tf.maskExpression = "{..}/{..}"
        tf.loadView(placeholder: "MM/YY")
        tf.keyboardType = .numberPad
        tf.textFieldChanged = { text in
            self.expiryChanged?(text)
        }
        return tf
    }()
    lazy var cvvTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "CVV")
        tf.keyboardType = .numberPad
        tf.textFieldChanged = { text in
            self.cvvChanged?(text)
        }
        return tf
    }()
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.apply(style: .orangeColor)
        button.setTitle("+ Add".localized(), for: .normal)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    }()
    lazy var stackview: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()

    lazy var paymentTermsLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular14, numberOfLines: 0, textColor: colors.mainTextColor))
        let text = "By clicking on Add button you agree to accept \nPayment Terms"
        label.text = text
        let attrString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "Payment Terms")
        attrString.addAttribute(NSAttributedString.Key.foregroundColor, value: colors.blueTextColor, range: range1)
        label.attributedText = attrString
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(labelTapped(gesture:))))
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        cardNumberTextField.delegate = self
        expiryTextField.delegate = self
        cvvTextField.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not veen implemented")
    }

    func clearAll() {
        cardNumberTextField.text = ""
        cardHoldernameTextField.text = ""
        expiryTextField.text = ""
        cvvTextField.text = ""
    }
}

extension AddCreditCardView: SetupCodeView {
    func buildViewHierarchy() {
        stackview.addArrangedSubview(expiryTextField)
        stackview.addArrangedSubview(cvvTextField)
        stackview.addArrangedSubview(addButton)
        addSubviews(cardHoldernameTextField, cardNumberTextField,
                    stackview ,paymentTermsLabel)
    }

    func setupConstraints() {
        cardHoldernameTextField.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        cardNumberTextField.anchor(
            top: cardHoldernameTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        stackview.anchor(
            top: cardNumberTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        paymentTermsLabel.anchor(
            top: stackview.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
    }
    func setupAdditionalConfiguration() {

    }
}

extension AddCreditCardView: UITextFieldDelegate {
    @objc func labelTapped(gesture: UITapGestureRecognizer) {
        let text = "By clicking on Add button you agree to accept \nPayment Terms"
        let termsRange = (text as NSString).range(of: "Payment Terms")
        if gesture.didTapAttributedTextInLabel(label: paymentTermsLabel, inRange: termsRange) {
            print("Payment Terms tapped")
        }
    }
    @objc func didTapAdd() {
        if let name = cardHoldernameTextField.text, let number = cardNumberTextField.text,
           let expiry = expiryTextField.text, let cvv = cvvTextField.text {
            self.addTapped?(name, number, expiry, cvv)
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        let characterSet = CharacterSet(charactersIn: string)
        if textField == expiryTextField {
            if text.count == 2, !string.isEmpty {
                textField.text = text + "/"
            }
            return CharacterSet.decimalDigits.isSuperset(of: characterSet) && newLength <= 5
        } else if textField == cvvTextField {
            return CharacterSet.decimalDigits.isSuperset(of: characterSet) && newLength <= 3
        } else if textField == cardNumberTextField {
            let cardText = textField.text
            textField.text = cardText?.applyPatternOnNumbers(pattern: "#### #### #### ####", replacmentCharacter: "#")
            let currentCharacterCount = textField.text?.count ?? 0
            if (range.length + range.location > currentCharacterCount) { return false }
            let newLength = currentCharacterCount + string.count - range.length
            var maxLength = 0
            if textField.isEqual(textField) {
                maxLength = 19
            }
            return newLength <= maxLength
        }else if textField == cardHoldernameTextField {
            return true
        }
        return CharacterSet.decimalDigits.isSuperset(of: characterSet) && newLength <= 3
    }
}
