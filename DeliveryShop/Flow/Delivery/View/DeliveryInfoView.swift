//
//  DeliveryInfoView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 15.02.2021.
//

import Foundation

class DeliveryInfoView: BaseView {
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.medium17, textColor: colors.mainTextColor))
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView(_ title: String) {
        infoLabel.text = title
    }
}

extension DeliveryInfoView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(infoLabel)
    }

    func setupConstraints() {
        infoLabel.centerView(to: self)
    }

    func setupAdditionalConfiguration() {
        borderWidth = 1
        borderColor = colors.blueTextColor
    }
}
