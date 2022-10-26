//
//  CampaignCell.swift
//  Walker Swift
//
//  Created by ssaylanc on 14.01.2021.
//

import UIKit

class CampaignCell: BaseCell {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        //view.layer.applyButtonShadow()
        //view.clipsToBounds = true
        return view
    }()
    private lazy var campaignImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "camp_back")
        image.clipsToBounds = true
        return image
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.bold20
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private lazy var brandImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "brand_icon")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()
    private lazy var couponLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.regular14
        label.textColor = Constants.Colors.mainTextColor
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private lazy var coinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private lazy var clockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clock")
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        return image
    }()

    override func setupViews() {
        setupView()
    }
    func setupCell() {
        backgroundColor = .clear
        titleLabel.text = "Adidas"
        coinLabel.text = "1000 coin".uppercased()
        durationLabel.text = "12 saat".uppercased()
        couponLabel.text = "10TL Kupon"
    }
}

extension CampaignCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(containerView,
                                     campaignImage,
                                     titleLabel,
                                     brandImage,
                                     couponLabel,
                                     coinLabel,
                                     durationLabel,
                                     clockImage)
    }
    func setupConstraints() {
        containerView.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )
        campaignImage.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: 0, height: 160)
        )
        coinLabel.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 26, left: 30, bottom: 0, right: 0)
        )
        durationLabel.anchor(
            top: containerView.topAnchor,
            leading: nil,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 26, left: 0, bottom: 0, right: 24)
        )
        clockImage.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: durationLabel.leadingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 6),
            size: .init(width: 20, height: 20)
        )
        clockImage.centerY(to: durationLabel)
        
        brandImage.anchor(
            top: campaignImage.bottomAnchor,
            leading: containerView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 16, left: 16, bottom: 0, right: 8),
            size: .init(width: 46, height: 46)
        )
        titleLabel.anchor(
            top: nil,
            leading: brandImage.trailingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 0, left: 12, bottom: 0, right: 0)
        )
        titleLabel.centerY(to: brandImage)

        couponLabel.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 16)
        )
        couponLabel.centerY(to: titleLabel)
        
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = Constants.Colors.backgroundColor
//        self.layer.cornerRadius = 12
//        contentView.addShadow(
//            offset: shadow.shadowOffset,
//            color: shadow.shadowColor,
//            opacity: shadow.shadowOpacity,
//            radius: shadow.shadowRadius
//        )
    }
}
