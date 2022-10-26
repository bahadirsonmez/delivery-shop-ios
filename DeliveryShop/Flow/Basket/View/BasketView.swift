//
//  EventView.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit
import SDWebImage

class BasketView: UIView {
    var tapped: (() -> Void)? = nil
    var checkoutTapped: (() -> Void)?
    var viewModel: BasketViewModel!
    var location: Location!
    
    let cellId = "cellId"
    let minLineSpacing = Constants.BasicCell.minLineSpacing
    let cellHeight = Constants.BasicCell.cellHeight
    let sectionInset = Constants.BasicCell.sectionInset
    let sectionInsetZero = Constants.BasicCell.sectionInsetZero
    
    private lazy var basketTotalView = BasketTotalView()
    private lazy var voucherView = VoucherView()

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 12, right: 12)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 12
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = Constants.Colors.backgroundColor
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
        bindActions()
    }
    func loadView(withViewModel vm: BasketViewModel) {
        viewModel = vm
    }
//    func loadEvent(_ model: EventItemModel) {
//        eventDetailImageView.loadView(withViewModel: model)
//        eventDetailView.loadView(withViewModel: model)
//        location = model.event.location ?? nil
//    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasketView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView, voucherView, basketTotalView)
    }
    
    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        collectionView.anchor(
            top: safeArea.topAnchor,
            leading: safeArea.leadingAnchor,
            bottom: voucherView.topAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0)
        )
        voucherView.anchor(
            top: nil,
            leading: safeArea.leadingAnchor,
            bottom: basketTotalView.topAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .zero, size: .init(width: 0, height: 84)
        )
        basketTotalView.anchor(
            top: nil,
            leading: safeArea.leadingAnchor,
            bottom: safeArea.bottomAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .zero, size: .init(width: 0, height: 132)
        )
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = Constants.Colors.backgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BasketCell.self,
                                forCellWithReuseIdentifier: cellId)
        collectionView.register(BasketHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerId")
        collectionView.reloadData()
    }
}

extension BasketView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        //return self.viewModel.numberOfEvents
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as! BasketCell
//        if let vm = self.viewModel.viewModelForEventItem(at: indexPath.row) {
//            cell.setupCell(withViewModel: vm)
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.rowTapped?(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: 200)
    }
    
    // MARK: - CollectionView Header
    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
      switch kind {
      case UICollectionView.elementKindSectionHeader:
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                           withReuseIdentifier: "headerId",
                           for: indexPath)  as! BasketHeader
        //headerView.loadHeader("What's Trending", actionTitle: "Show All")
        return headerView
      default:
        fatalError("Unexpected element kind")
      }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 72)
    }
}

extension BasketView {
    private func bindActions() {
        basketTotalView.checkoutTapped = {
            self.checkoutTapped?()
        }
    }
}
