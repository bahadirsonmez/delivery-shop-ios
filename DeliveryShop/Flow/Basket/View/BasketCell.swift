//
//  EventCell.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class BasketCell: BaseCell {
    lazy var eventAvatar : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.bold10
        label.textColor = Constants.Colors.eventPageTextColor
        label.text = "Placeholder"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var check : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "check")
        return image
    }()
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension BasketCell : SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(eventAvatar,
                                     cellTitle,
                                     check)
    }
    func setupConstraints() {
        eventAvatar.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0),
            size: .init(width: 40, height: 40)
        )
        cellTitle.anchor(
            top: eventAvatar.bottomAnchor,
            leading: eventAvatar.leadingAnchor,
            bottom: nil,
            trailing: eventAvatar.trailingAnchor,
            padding: .init(top: 6, left: 0, bottom: 0, right: 0)
        )
        cellTitle.centerX(to: eventAvatar)
        check.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: nil,
            size: .init(width: 15, height: 15)
        )
        check.centerView(to: eventAvatar)
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 12
        contentView.addShadow(
            offset: shadow.shadowOffset,
            color: shadow.shadowColor,
            opacity: shadow.shadowOpacity,
            radius: shadow.shadowRadius
        )
    }
}
