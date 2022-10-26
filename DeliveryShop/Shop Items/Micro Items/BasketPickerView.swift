//
//  BasketPickerView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

class BasketPickerView: UIView {
    var sizeTapped: (() -> Void)? = nil
    var colorTapped: (() -> Void)? = nil
    var quantityTapped: (() -> Void)? = nil

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.backgroundColor = .white
        stack.spacing = 15.0
        return stack
    }()
    
    private lazy var sizeBack: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.gray
        view.cornerRadius = Constants.Radius.corner
        return view
    }()
    
    private lazy var sizeTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "M"
        return label
    }()
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "1"
        return label
    }()
    
    private lazy var colorBack: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.gray
        view.cornerRadius = Constants.Radius.corner
        return view
    }()
    
    private lazy var quantityBack: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.gray
        view.cornerRadius = Constants.Radius.corner
        return view
    }()
    
    private lazy var down1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Arrow Down")
        image.contentMode = .scaleToFill
        return image
    }()
    private lazy var down2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Arrow Down")
        image.contentMode = .scaleToFill
        return image
    }()
    private lazy var down3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Arrow Down")
        image.contentMode = .scaleToFill
        return image
    }()
    
    private lazy var color: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgba: "#05C2BD")
        view.cornerRadius = 12
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = Constants.Colors.backgroundColor
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasketPickerView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(stackView)
        stackView.addArrangedSubview(sizeBack)
        stackView.addArrangedSubview(colorBack)
        stackView.addArrangedSubview(quantityBack)
        
        sizeBack.addSubviews(down1, sizeTitle)
        colorBack.addSubviews(down2, color)
        quantityBack.addSubviews(down3, quantityLabel)

    }
    
    func setupConstraints() {
        stackView.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 44))
        
        sizeBack.anchor(top: stackView.topAnchor,
                        leading: nil,
                        bottom: stackView.bottomAnchor,
                        trailing: nil,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                        size: .init(width: 0, height: 44))
        colorBack.anchor(top: stackView.topAnchor,
                        leading: nil,
                        bottom: stackView.bottomAnchor,
                        trailing: nil,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                        size: .init(width: 0, height: 44))
        quantityBack.anchor(top: stackView.topAnchor,
                        leading: nil,
                        bottom: stackView.bottomAnchor,
                        trailing: nil,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                        size: .init(width: 0, height: 44))
        
        down1.anchor(top: nil,
                         leading: nil,
                         bottom: nil,
                         trailing: sizeBack.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                         size: .init(width: 24, height: 24))
        down1.centerY(to: sizeBack)
        down2.anchor(top: nil,
                         leading: nil,
                         bottom: nil,
                         trailing: colorBack.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                         size: .init(width: 24, height: 24))
        down2.centerY(to: colorBack)
        color.anchor(top: nil,
                     leading: colorBack.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: .init(top: 0, left: 20, bottom: 0, right: 0),
                         size: .init(width: 24, height: 24))
        color.centerY(to: colorBack)
        down3.anchor(top: nil,
                         leading: nil,
                         bottom: nil,
                         trailing: quantityBack.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                         size: .init(width: 24, height: 24))
        down3.centerY(to: quantityBack)
        sizeTitle.anchor(top: nil,
                         leading: sizeBack.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        sizeTitle.centerY(to: sizeBack)
        quantityLabel.anchor(top: nil,
                         leading: quantityBack.leadingAnchor,
                         bottom: nil,
                         trailing: nil,
                         padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        quantityLabel.centerY(to: quantityBack)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
    }
}
