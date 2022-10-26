//
//  CategoryCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 19.01.2021.
//

import UIKit

class CategoryCell: BaseCell {
    lazy var categoryImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(rgba: "#F6F6F6")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = Constants.Colors.mainTextColor
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Clothing"
        return label
    }()
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blueTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "517 items"
        return label
    }()
    private lazy var chevron: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Arrow Right")
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension CategoryCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(categoryImage,
                                     title, subtitle,
                                     chevron)
    }
    func setupConstraints() {
        categoryImage.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 10, left: 20, bottom: 10, right: 0),
            size: .init(width: 96, height: 96)
        )
        title.anchor(
            top: categoryImage.topAnchor,
            leading: categoryImage.trailingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 20)
        )
        subtitle.anchor(
            top: title.bottomAnchor,
            leading: categoryImage.trailingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: .init(top: 6, left: 20, bottom: 0, right: 20)
        )
        chevron.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 20),
            size: .init(width: 24, height: 24)
        )
        chevron.centerY(to: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 12
        contentView.addShadow(
            offset: shadow.shadowOffset,
            color: shadow.shadowColor,
            opacity: shadow.shadowOpacity,
            radius: shadow.shadowRadius
        )
    }
}
