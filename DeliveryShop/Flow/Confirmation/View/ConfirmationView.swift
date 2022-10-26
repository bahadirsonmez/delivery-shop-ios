//
//  ConfirmationView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 16.02.2021.
//
import UIKit
import SDWebImage

class ConfirmationView: BaseView {
    var tapped: (() -> Void)? = nil
    var viewModel: DeliveryViewModel!

    let deliveryAddressCellId = "deliveryAddressCellId"

    lazy var basketTotalView = BasketTotalView()

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        layout.minimumLineSpacing = 0
        //        layout.minimumInteritemSpacing = 12
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = Constants.Colors.backgroundColor
        setupView()
    }
    func loadView(withViewModel vm: DeliveryViewModel) {
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

extension ConfirmationView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView, basketTotalView)
    }

    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        collectionView.anchor(
            top: safeArea.topAnchor,
            leading: safeArea.leadingAnchor,
            bottom: basketTotalView.topAnchor,
            trailing: safeArea.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 0)
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
        basketTotalView.button.setTitle("Payment Method", for: .normal)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(DeliveryAddressCell.self,
                                forCellWithReuseIdentifier: deliveryAddressCellId)
        collectionView.register(BasketHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerId")
        collectionView.reloadData()
    }
}

extension ConfirmationView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: deliveryAddressCellId,
                                                      for: indexPath) as! DeliveryAddressCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.rowTapped?(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
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
            headerView.loadHeader("Delivery", actionTitle: "Order number is 4839200012")
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

