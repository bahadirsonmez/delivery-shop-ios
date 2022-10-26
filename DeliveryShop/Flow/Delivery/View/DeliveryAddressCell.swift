//
//  DeliveryAddressCell.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 15.02.2021.
//

import Foundation

class DeliveryAddressCell: BaseCell {
    lazy var shippingInfo: DeliveryInfoView = {
        let view = DeliveryInfoView()
        view.loadView("Free shipping and free returns")
        view.cornerRadius = 6
        return view
    }()
    lazy var addressCheckbox: DeliveryCheckbox = {
        let cb = DeliveryCheckbox()
        cb.isUserInteractionEnabled = true
        cb.loadView("Billing and delivery \ninfo are the same", isChecked: true)
        cb.cornerRadius = 6
        return cb
    }()
    lazy var ageCheckbox: DeliveryCheckbox = {
        let cb = DeliveryCheckbox()
        cb.isUserInteractionEnabled = true
        cb.loadView("Yes, I am over \n18 years old")
        cb.cornerRadius = 6
        return cb
    }()
    lazy var checkboxStackview: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    lazy var fullNameTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Full Name")
        return tf
    }()
    lazy var streetTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Street")
        return tf
    }()
    lazy var cityTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "City/Town")
        tf.keyboardType = .numberPad
        return tf
    }()
    lazy var stateTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "State")
        return tf
    }()
    lazy var zipTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Zip Code")
        tf.keyboardType = .numberPad
        return tf
    }()
    lazy var stateZipStackview: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 15
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    lazy var phoneTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Phone Number")
        tf.keyboardType = .phonePad
        return tf
    }()
    lazy var emailTextField: HamurTextField = {
        let tf = HamurTextField()
        tf.loadView(placeholder: "Email Address")
        tf.keyboardType = .emailAddress
        return tf
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not veen implemented")
    }

}

extension DeliveryAddressCell: SetupCodeView {
    func buildViewHierarchy() {
        stateZipStackview.addArrangedSubview(stateTextField)
        stateZipStackview.addArrangedSubview(zipTextField)
        checkboxStackview.addArrangedSubview(addressCheckbox)
        checkboxStackview.addArrangedSubview(ageCheckbox)
        addSubviews(shippingInfo, checkboxStackview, fullNameTextField, streetTextField, cityTextField,
                    stateZipStackview, phoneTextField, emailTextField)
    }

    func setupConstraints() {
        shippingInfo.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 60)
        )
        checkboxStackview.anchor(
            top: shippingInfo.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 135)
        )
        fullNameTextField.anchor(
            top: checkboxStackview.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        streetTextField.anchor(
            top: fullNameTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        cityTextField.anchor(
            top: streetTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        stateZipStackview.anchor(
            top: cityTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        phoneTextField.anchor(
            top: stateZipStackview.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
        emailTextField.anchor(
            top: phoneTextField.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20),
            size: .init(width: 0, height: 45)
        )
    }

    func setupAdditionalConfiguration() {
        isUserInteractionEnabled = true
    }
}
