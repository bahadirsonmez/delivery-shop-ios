//
//  VerticalSectionHeaderCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class VerticalSectionHeaderCell: BaseCell {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "New Arrivals"
        return label
    }()
    
    private lazy var actionTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.blueTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "Show All"
        return label
    }()
    
    override func setupViews() {
        setupView()
    }
    
    func loadHeader(_ title: String, actionTitle: String) {
        self.title.text = title
        self.actionTitle.text = actionTitle
    }
}

extension VerticalSectionHeaderCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(title, actionTitle)
    }
    func setupConstraints() {
        title.anchor(top: nil,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        title.centerY(to: self)
        actionTitle.anchor(top: nil,
                     leading: nil,
                     bottom: nil,
                     trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        actionTitle.centerY(to: self)
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
