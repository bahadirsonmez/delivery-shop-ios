//
//  File.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

class BasicHeader: UICollectionReusableView {
    lazy var label: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = Constants.Colors.dimmedText
        label.font = Constants.Fonts.font0bn
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(label)
        let padding = Constants.BasicCell.padding
        label.anchor(top: nil,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: padding, bottom: 0, right: 0))
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
