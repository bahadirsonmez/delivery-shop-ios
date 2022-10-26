//
//  HistoryView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class HistorySection: BaseCell, SetupCodeView {
    
    lazy var collectionView = HistoryView()
    
    private lazy var titleContainer: UIView = {
        let view = UIView()
        return view
    }()
    
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
    func buildViewHierarchy() {
        contentView.addSubview(titleContainer)
        titleContainer.addSubviews(title, actionTitle)
        contentView.addSubview(collectionView)
    }
    func setupConstraints() {
        titleContainer.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: nil,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 60))
        title.anchor(top: nil,
                     leading: titleContainer.leadingAnchor,
                     bottom: nil,
                     trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        title.centerY(to: titleContainer)
        actionTitle.anchor(top: nil,
                     leading: nil,
                     bottom: nil,
                     trailing: titleContainer.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        actionTitle.centerY(to: titleContainer)
        
        collectionView.anchor(top: titleContainer.bottomAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 255))
    }
    
    func setupAdditionalConfiguration() {
    }
}

// MARK: - Header olarak kullacaksan "UICollectionReusableView" olmalı

class HistoryView: UICollectionReusableView {
    var accountTapped : (() -> Void)? = nil
    var notificationTapped : (() -> Void)? = nil
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self,
                                forCellWithReuseIdentifier: "productCellId")
    }
}

extension HistoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCellId",
                                                      for: indexPath) as!  ProductCell
//        cell.setupCell(
//            Constants.CellTitles.menuTitles[indexPath.row],
//            menuImageName: Constants.CellImages.menuImages[indexPath.row]
//        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 235.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
