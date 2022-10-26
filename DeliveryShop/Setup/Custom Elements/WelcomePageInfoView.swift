//
//  WelcomePageInfoView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 11.02.2021.
//

import Foundation
class WelcomePageInfoView: BaseView {
    lazy var leftIcon: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .center
        iv.cornerRadius = 23
        iv.backgroundColor = colors.grayButtonBorder
        return iv
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: Constants.Fonts.Bold16Font,
                                 textAlignment: .left,
                                 textColor: Constants.Colors.mainTextColor))
//        label.text = "Or sign up with social networks"
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: Constants.Fonts.light14,
                                 textAlignment: .left,
                                 textColor: Constants.Colors.grayTextColor))
//        label.text = "Or sign up with social networks"
        return label
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView(title: String, subtitle: String, image: UIImage) {
        leftIcon.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

}


extension WelcomePageInfoView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(leftIcon, titleLabel, subtitleLabel)
    }

    func setupConstraints() {
        leftIcon.anchor(
            top: nil,
            leading: leadingAnchor,
            bottom: nil,
            trailing: nil,
            size: .init(width: 45, height: 45)
        )
        titleLabel.anchor(
            top: leftIcon.topAnchor,
            leading: leftIcon.trailingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 0, left: 15, bottom: 0, right: 0)
        )
        subtitleLabel.anchor(
            top: nil,
            leading: leftIcon.trailingAnchor,
            bottom: leftIcon.bottomAnchor,
            trailing: nil,
            padding: .init(top: 0, left: 15, bottom: 0, right: 0)
        )
    }

    func setupAdditionalConfiguration() {

    }


}
