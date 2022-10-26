//
//  TrendingCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class TrendingCell: BaseCell {
    private lazy var image: UIImageView = {
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
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "VFA Boost"
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blueTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Sneakers"
        return label
    }()
    
    private lazy var priceContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.blueTextColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "$105.50"
        return label
    }()
    
    private lazy var seperator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgba: "#E6E6E7")
        return view
    }()
    
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension TrendingCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, productTitle, subtitle,
                                     priceContainer, price,
                                     seperator)
    }
    func setupConstraints() {
        image.anchor(top: nil,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: 20, bottom: 0, right: 0),
                     size: .init(width: 44, height: 44))
        image.centerY(to: self)
        productTitle.anchor(top: image.topAnchor,
                     leading: image.trailingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 1, left: 12, bottom: 0, right: 8))
        subtitle.anchor(top: productTitle.bottomAnchor,
                     leading: productTitle.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 2, left: 0, bottom: 0, right: 8))
        priceContainer.anchor(top: nil,
                              leading: nil,
                              bottom: nil,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                              size: .init(width: 80, height: 36))
        priceContainer.centerY(to: self)
        price.centerView(to: priceContainer)
        
        seperator.anchor(top: nil,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 1))
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
