//
//  VoucherView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class VoucherView: UIView, UITextFieldDelegate {
    var checkoutTapped: (() -> Void)? = nil

    private lazy var searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = UIColor(rgba: "#F6F6F6")
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = Constants.Colors.mainTextColor
        textfield.placeholder = "Search"
        textfield.clearsOnBeginEditing = true
        textfield.clearButtonMode = .always
        textfield.delegate = self
        textfield.text = "34800929012"
        textfield.tintColor = Constants.Colors.secondaryTextColor
        textfield.setIcon(UIImage(systemName: "ticket")!)
        return textfield
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgba: "#FFA601")
        button.cornerRadius = 6
        button.setTitle("Employ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = Constants.Colors.backgroundColor
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VoucherView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(searchTextField,
                         button)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        searchTextField.anchor(
            top: nil,
            leading: safeArea.leadingAnchor,
            bottom: nil,
            trailing: button.leadingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 15),
            size: .init(width: 0, height: 44)
        )
        searchTextField.centerY(to: self)
        button.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20),
            size: .init(width: 100, height: 44)
        )
        button.centerY(to: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
