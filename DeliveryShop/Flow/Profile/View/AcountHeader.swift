//
//  AcountHeader.swift
//  DeliveryShop
//
//  Created by ssaylanc on 7.02.2021.
//

import UIKit

class AcountHeader: UICollectionReusableView {
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(rgba: "#F6F6F6")
        return imageView
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = Constants.Colors.mainTextColor
        label.text = "Kullanıcı Adı"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.regular14
        label.textColor = Constants.Colors.secondaryTextColor
        label.numberOfLines = 1
        label.text = "E-mail"
        label.textAlignment = .left
        return label
    }()
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.regular14
        label.textColor = Constants.Colors.secondaryTextColor
        label.numberOfLines = 1
        label.text = "GSM No"
        label.textAlignment = .left
        return label
    }()
    
    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgba: "#F6F6F6")
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
        addSubviews(profileImage, name, emailLabel, phoneLabel, seperatorView)
        profileImage.anchor(top: self.topAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: nil,
                            padding: .init(top: 30, left: 0, bottom: 0, right: 0),
                            size: .init(width: 88, height: 88))
        profileImage.centerX(to: self)
        name.anchor(top: profileImage.bottomAnchor,
                    leading: nil,
                    bottom: nil,
                    trailing: nil,
                    padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        name.centerX(to: self)
        emailLabel.anchor(top: name.bottomAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        emailLabel.centerX(to: self)
        phoneLabel.anchor(top: emailLabel.bottomAnchor,
                          leading: nil,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 2, left: 20, bottom: 0, right: 0))
        phoneLabel.centerX(to: self)
        seperatorView.placeBottom(to: self, height: 10)

    }
    
    func setupHeader() {
        profileImage.cornerRadius = 44
        name.text = "blackcherry@gmail.com"
        emailLabel.text = "blackcherry@gmail.com"
        phoneLabel.text = "9056512312"
        backgroundColor = .white
    }
}
