//
//  BasketTotalView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class BasketTotalView: UIView {
    var checkoutTapped: (() -> Void)?

    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.Colors.blueTextColor
        button.cornerRadius = 6
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Order Amount:"
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.secondaryTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Your total amount of discount:"
        return label
    }()
    
    private lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "$103.88"
        return label
    }()
    
    private lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.secondaryTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "- $55.02"
        return label
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

extension BasketTotalView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(title, subTitle,
                         totalPriceLabel, discountLabel,
                         button)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        title.anchor(
            top: safeArea.topAnchor,
            leading: safeArea.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 12, left: 20, bottom: 0, right: 0)
        )
        subTitle.anchor(
            top: title.bottomAnchor,
            leading: safeArea.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 2, left: 20, bottom: 0, right: 0)
        )
        totalPriceLabel.anchor(
            top: safeArea.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 12, left: 0, bottom: 0, right: 20)
        )
        discountLabel.anchor(
            top: totalPriceLabel.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 2, left: 0, bottom: 0, right: 20)
        )
        button.anchor(
            top: nil,
            leading: safeArea.leadingAnchor,
            bottom: safeArea.bottomAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 20, right: 20),
            size: .init(width: 0, height: 44)
        )
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = UIColor(rgba: "#F6F6F6")
    }
}

extension BasketTotalView {
    @objc func didTapButton() {
        self.checkoutTapped?()
    }
}
