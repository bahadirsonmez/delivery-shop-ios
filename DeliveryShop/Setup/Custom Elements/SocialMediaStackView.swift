//
//  SocialMediaStackView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 9.02.2021.
//

import Foundation

class SocialMediaStackView: UIView {
    var twitterTapped: (() -> Void)?
    var googleTapped: (() -> Void)?
    var facebookTapped: (() -> Void)?

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: Constants.Fonts.regular16,
                                 textColor: Constants.Colors.mainTextColor))
        label.text = "Or sign up with social networks"
        return label
    }()
    lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.apply(style: .clearColor)
        button.setImage(UIImage(named: "twitter")!, for: .normal)
        button.setImage(UIImage(named: "twitter")!.withTintColor(UIColor(rgba: "#1da1f2")), for: .highlighted)
        button.addTarget(self, action: #selector(didTapTwitter), for: .touchUpInside)
        return button
    }()
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.apply(style: .clearColor)
        button.setImage(UIImage(named: "google")!, for: .normal)
        button.setImage(UIImage(named: "google")!.withTintColor(UIColor(rgba: "#ea4335")), for: .highlighted)
        button.addTarget(self, action: #selector(didTapGoogle), for: .touchUpInside)
        return button
    }()
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.apply(style: .clearColor)
        button.setImage(UIImage(named: "facebook")!, for: .normal)
        button.setImage(UIImage(named: "facebook")!.withTintColor(UIColor(rgba: "#2d88ff")), for: .highlighted)
        button.addTarget(self, action: #selector(didTapFacebook), for: .touchUpInside)
        return button
    }()
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView(title: String) {
        titleLabel.text = title
    }
}

extension SocialMediaStackView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(titleLabel, stackView)
        stackView.addArrangedSubview(twitterButton)
        stackView.addArrangedSubview(googleButton)
        stackView.addArrangedSubview(facebookButton)
    }

    func setupConstraints() {
        titleLabel.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor
        )
        stackView.anchor(
            top: nil,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            size: .init(width: 0, height: 45)
        )
    }

    func setupAdditionalConfiguration() {

    }
}

extension SocialMediaStackView {
    @objc func didTapTwitter() {
        self.twitterTapped?()
    }
    @objc func didTapGoogle() {
        self.googleTapped?()
    }
    @objc func didTapFacebook() {
        self.facebookTapped?()
    }
}

