//
//  SectionHeader.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    var buttonTapped : (() -> Void)? = nil
    var notificationTapped : (() -> Void)? = nil
    
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
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
//        button.setTitle("New Arrivals", for: .normal)
        button.setTitleColor(Constants.Colors.blueTextColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.addTarget(self, action: #selector(didTapHeaderButton), for: .touchUpInside)
        return button
    }()

    private lazy var seperator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgba: "#E6E6E7")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTapHeaderButton() {
        self.buttonTapped?()
    }
    func setupUI(){
        addSubviews(seperator ,title, actionTitle, actionButton)
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
        actionButton.anchor(
            top: actionTitle.topAnchor,
            leading: actionTitle.leadingAnchor,
            bottom: actionTitle.bottomAnchor,
            trailing: actionTitle.trailingAnchor)
        seperator.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: nil,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 1))

    }
    
    func loadHeader(_ title: String, actionTitle: String) {
        self.title.text = title
        self.actionTitle.text = actionTitle
    }
}

