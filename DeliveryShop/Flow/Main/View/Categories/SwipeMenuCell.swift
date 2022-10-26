//
//  SwipeMenuCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

class SwipeMenuCell: BaseCell {
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension SwipeMenuCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(title)
    }
    func setupConstraints() {
        title.centerView(to: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
