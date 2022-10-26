//
//  AccountFooter.swift
//  DeliveryShop
//
//  Created by ssaylanc on 7.02.2021.
//

import UIKit

class AccountFooter: UICollectionReusableView {
    var logoutTapped: (() -> Void)?

    lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgba: "#C8435F")
        button.cornerRadius = 6
        button.setTitle("Çıkış Yap", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        return button
    }()
    
    @objc func logoutAction() {
        self.logoutTapped?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubviews(button)
        button.anchor(top: nil,
                      leading: self.leadingAnchor,
                      bottom: self.bottomAnchor,
                      trailing: self.trailingAnchor,
                      padding: .init(top: 0, left: 20, bottom: 20, right: 20),
                      size: .init(width: 0, height: 44))
    }
    
    func setupHeader() {
        backgroundColor = UIColor(rgba: "#F6F6F6")
    }
}
