//
//  CategoriesView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 19.01.2021.
//

import UIKit

class CategoriesView: UIView {
    var onCategorySelect: (() -> Void)?
    private lazy var swipeMenu: SwipeMenu = SwipeMenu()

    private let spacing:CGFloat = 20.0
    
    var safeArea = UILayoutGuide()
    let productCellHeight: CGFloat = 116.0
    let cellHeight: CGFloat = 90.0
    let headerHeight: CGFloat = 240.0
    let cellId = Constants.BasicCell.cellID
    let headerId = Constants.BasicCell.headerID
    let swipeCellId = "swipeCellId"
    
    var rowTapped : ((Int) -> Void)?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}

extension CategoriesView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(swipeMenu, collectionView)
    }
    
    func setupConstraints() {
        safeArea = self.safeAreaLayoutGuide
        collectionView.anchor(top: safeArea.topAnchor,
                              leading: safeArea.leadingAnchor,
                              bottom: safeArea.bottomAnchor,
                              trailing: safeArea.trailingAnchor,
                              padding: Constants.paddingZero)
    }
    
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SwipeMenuSection.self,
                                forCellWithReuseIdentifier: swipeCellId)
        collectionView.register(CategoryCell.self,
                                forCellWithReuseIdentifier: cellId)
    }
}

extension CategoriesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else {
            return 4
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: swipeCellId,
                                                          for: indexPath) as!  SwipeMenuSection
            cell.setupSection(items: ["All", "Men", "Women", "Kids"])
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                          for: indexPath) as!  CategoryCell
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onCategorySelect?()
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        if indexPath.section == 0 {
            return CGSize(width: width, height: 52.0)
        }else {
            return CGSize(width: width, height: productCellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
