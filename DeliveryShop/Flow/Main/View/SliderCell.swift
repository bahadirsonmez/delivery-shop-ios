//
//  BannerCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 19.01.2021.
//

import UIKit

class SliderCell: BaseCell {
    lazy var image : UIImageView = {
        let imageView = UIImageView()
        //imageView.image = UIImage(named: "banner1")
        imageView.backgroundColor = UIColor(rgba: "#90ccfe")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "New\ncollection"
        return label
    }()
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension SliderCell : SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, title)
    }
    func setupConstraints() {
        image.fillSuperview()
        title.centerView(to: image)
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
