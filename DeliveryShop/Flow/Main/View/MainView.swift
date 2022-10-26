//
//  DonationsView.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class MainView: UIView {
        
    var safeArea = UILayoutGuide()
    let minLineSpacing = Constants.BasicCell.minLineSpacing
    let cellHeight = Constants.BasicCell.cellHeight
    let headerHeight = Constants.HeaderSize.profileHeader.height
    let sectionInset = Constants.BasicCell.sectionInset
    let sectionInsetZero = Constants.BasicCell.sectionInsetZero
    let cellId = Constants.BasicCell.cellID
    let headerId = Constants.BasicCell.headerID
    
    var rowTapped : ((Int) -> Void)?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
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

extension MainView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView)
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
        collectionView.register(BasicCell.self,
                                forCellWithReuseIdentifier: cellId)
    }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as!  BasicCell
//        cell.setupCell(
//            Constants.CellTitles.menuTitles[indexPath.row],
//            menuImageName: Constants.CellImages.menuImages[indexPath.row]
//        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.rowTapped?(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32,
                      height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minLineSpacing
    }
}
