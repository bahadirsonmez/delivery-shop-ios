//
//  WalletView.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class SearchView: UIView, UITextFieldDelegate {
    private let spacing:CGFloat = 20.0
    
    var safeArea = UILayoutGuide()
    let cellId = Constants.BasicCell.cellID
    
    var rowTapped : ((Int) -> Void)?
    
    private lazy var searchBarContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = UIColor(rgba: "#F6F6F6")
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.textColor = Constants.Colors.mainTextColor
        textfield.placeholder = "Search"
        textfield.clearsOnBeginEditing = true
        textfield.clearButtonMode = .always
        textfield.delegate = self
        textfield.tintColor = Constants.Colors.secondaryTextColor
        textfield.setIcon(UIImage(systemName: "magnifyingglass")!)
        return textfield
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    private lazy var seperator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgba: "#E6E6E7")
        return view
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

extension SearchView : SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(searchBarContainer)
        self.searchBarContainer.addSubviews(searchTextField, seperator)
        self.addSubviews(collectionView)
    }
    
    func setupConstraints() {
        safeArea = self.safeAreaLayoutGuide
        searchBarContainer.anchor(top: safeArea.topAnchor,
                                  leading: safeArea.leadingAnchor,
                                  bottom: nil,
                                  trailing: safeArea.trailingAnchor,
                                  padding: Constants.paddingZero,
                                  size: .init(width: 0, height: 60))
        searchTextField.anchor(top: nil,
                                  leading: safeArea.leadingAnchor,
                                  bottom: nil,
                                  trailing: safeArea.trailingAnchor,
                                  padding: .init(top: 0, left: 20, bottom: 0, right: 20),
                                  size: .init(width: 0, height: 36))
        searchTextField.centerY(to: searchBarContainer)
        seperator.anchor(top: nil,
                          leading: safeArea.leadingAnchor,
                          bottom: searchBarContainer.bottomAnchor,
                          trailing: safeArea.trailingAnchor,
                          padding: Constants.paddingZero,
                          size: .init(width: 0, height: 1))
        collectionView.anchor(top: searchBarContainer.bottomAnchor,
                              leading: safeArea.leadingAnchor,
                              bottom: safeArea.bottomAnchor,
                              trailing: safeArea.trailingAnchor,
                              padding: Constants.paddingZero)
    }
    
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductVerticalCell.self,
                                forCellWithReuseIdentifier: cellId)
        searchTextField.cornerRadius = 16
    }
}

extension SearchView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as!  ProductVerticalCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.rowTapped?(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: 110)
    }
}
