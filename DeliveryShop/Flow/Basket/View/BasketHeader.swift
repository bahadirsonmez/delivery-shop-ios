//
//  BasketHeader.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class BasketHeader: UICollectionReusableView {
    var buttonTapped : (() -> Void)? = nil
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Your bag"
        return label
    }()
    
    private lazy var actionTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.secondaryTextColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "You have 3 items in your bag"
        return label
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
    
    func setupUI(){
        addSubviews(title, actionTitle, seperator)
        title.anchor(top: self.topAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        actionTitle.anchor(top: title.bottomAnchor,
                           leading: title.leadingAnchor,
                           bottom: nil,
                           trailing: nil,
                           padding: .init(top: 2, left: 0, bottom: 0, right: 20))
        seperator.anchor(top: nil,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 1))
    }
    
    func loadHeader(_ title: String, actionTitle: String) {
        self.title.text = title
        self.actionTitle.text = actionTitle
    }
}

