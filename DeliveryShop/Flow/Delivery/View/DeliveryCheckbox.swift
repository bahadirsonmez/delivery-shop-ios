//
//  DeliveryCheckbox.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 15.02.2021.
//

import Foundation

class DeliveryCheckbox: BaseView {
    var checkboxTapped: (() -> Void)?
    var isChecked: Bool = false

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "select-button")
        iv.contentMode = .scaleToFill
        return iv
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.regular14, textColor: colors.grayTextColor))
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView(_ title: String, isChecked: Bool = false) {
        infoLabel.text = title
        imageView.image = UIImage(named: isChecked ? "selected-button" : "select-button" )
        self.isChecked = isChecked
    }

    private func changeStatus() {
        DispatchQueue.main.async {
            self.isChecked = !self.isChecked
            self.imageView.image = UIImage(named: self.isChecked ? "selected-button" : "select-button" )
        }
    }

}

extension DeliveryCheckbox: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(imageView, infoLabel, button)
    }

    func setupConstraints() {
        imageView.anchor(
            top: topAnchor,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0),
            size: .init(width: 44, height: 44)
        )
        imageView.centerX(to: self)
        infoLabel.anchor(
            top: imageView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 15, left: 15, bottom: 0, right: 15)
        )
        infoLabel.centerX(to: self)
        button.fillSuperview()
    }

    func setupAdditionalConfiguration() {
        borderWidth = 1
        borderColor = colors.grayButtonBorder
    }

    @objc func didTap() {
        self.checkboxTapped?()
        self.changeStatus()
    }
}

