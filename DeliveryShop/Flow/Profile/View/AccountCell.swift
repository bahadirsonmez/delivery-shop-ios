//
//  AccountCell.swift
//  DeliveryShop
//
//  Created by ssaylanc on 7.02.2021.
//

import UIKit

class AccountCell : BaseCell {
    var hasRightIcon: Bool = false
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = UIColor(rgba: "#2D2D2F")
        label.numberOfLines = 1
        return label
    }()
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor(rgba: "#2D2D2F")
        label.numberOfLines = 1
        return label
    }()
    lazy var cellIconRight: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "Arrow Right")
        iv.isHidden = true
        return iv
    }()
    override func setupViews() {
        super.setupViews()
        setupLayout()
    }
    
    func setupCell(_ cellTitle: String) {
        backgroundColor = UIColor(rgba: "#F6F6F6")
        titleLabel.text = cellTitle
        detailLabel.text = "Murat Balcı"
    }

    private func setupLayout() {
        let safeArea = self.safeAreaLayoutGuide
        contentView.addSubview(cellView)
        cellView.addSubviews(titleLabel, detailLabel, cellIconRight)
        cellView.anchor(
            top: safeArea.topAnchor,
            leading: safeArea.leadingAnchor,
            bottom: safeArea.bottomAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 5, right: 0),
            size: .init(width: 0, height: 58)
        )
        titleLabel.anchor(
            top: nil,
            leading: cellView.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 0, left: 20, bottom: 0, right: 0)
        )
        titleLabel.centerY(to: cellView)
        detailLabel.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: cellView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: hasRightIcon ? 20 : 56)
        )
        detailLabel.centerY(to: cellView)
        cellIconRight.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 20),
            size: .init(width: 24, height: 24)
        )
        cellIconRight.centerY(to: self)
    }
}
