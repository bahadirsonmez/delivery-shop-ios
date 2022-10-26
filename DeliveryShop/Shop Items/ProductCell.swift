//
//  ProductCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class ProductCell: BaseCell {
    private lazy var image : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(rgba: "#F6F6F6")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var likeIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "heart")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var productTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Falcon Clear Pink"
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blueTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Sneakers"
        return label
    }()
    
    private lazy var discountedPrice: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "$70.00"
        return label
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.secondaryTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "$105.50"
        return label
    }()
    
    
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension ProductCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, likeIcon,
                                     productTitle, subtitle,
                                     discountedPrice, price)
    }
    func setupConstraints() {
        image.anchor(top: self.topAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                     size: .init(width: 160, height: 160))
        likeIcon.anchor(top: self.topAnchor,
                        leading: nil,
                        bottom: nil,
                        trailing: self.trailingAnchor,
                        padding: .init(top: 15, left: 0, bottom: 0, right: 15),
                        size: .init(width: 24, height: 24))
        
        productTitle.anchor(top: image.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 8, left: 0, bottom: 0, right: 8))
        subtitle.anchor(top: productTitle.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 4, left: 0, bottom: 0, right: 8))
        discountedPrice.anchor(top: subtitle.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        price.anchor(top: nil,
                     leading: discountedPrice.trailingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        price.centerY(to: discountedPrice)    
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
//        self.layer.cornerRadius = 12
//        contentView.addShadow(
//            offset: shadow.shadowOffset,
//            color: shadow.shadowColor,
//            opacity: shadow.shadowOpacity,
//            radius: shadow.shadowRadius
//        )
    }
}
