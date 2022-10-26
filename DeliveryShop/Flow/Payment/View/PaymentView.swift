//
//  PaymentView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 12.02.2021.
//
import UIKit
import SDWebImage

class PaymentView: BaseView {
    var tapped: (() -> Void)? = nil
    var viewModel: PaymentViewModel!

    let creditCardFormSectionId = "creditCardFormSectionId"
    let availableCreditCardsCellId = "availableCreditCardsCellId"
    let addCreditCardCellId = "addCreditCardCellId"
    let swipeCellId = "swipeMenuCellId"
    var cardNumber = ""
    var cardHolder = ""
    var expiryYear: UInt = 0
    var expiryMonth: UInt = 0
    var cvv = ""

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
    func loadView(withViewModel vm: PaymentViewModel) {
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

extension PaymentView: SetupCodeView {
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
        basketTotalView.button.setTitle("Confirmation", for: .normal)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SwipeMenuSection.self,
                                forCellWithReuseIdentifier: swipeCellId)
        collectionView.register(CreditCardFormSection.self,
                                forCellWithReuseIdentifier: creditCardFormSectionId)

//        collectionView.register(CreditCardPreviewSection.self,
//                                forCellWithReuseIdentifier: availableCreditCardsCellId)
        collectionView.register(AddCreditCardSection.self,
                                forCellWithReuseIdentifier: addCreditCardCellId)
        collectionView.register(BasketHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerId")
        collectionView.register(SectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "sectionHeaderId")

        collectionView.reloadData()
    }
}

extension PaymentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        default:
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: swipeCellId,
                                                              for: indexPath) as!  SwipeMenuSection
                cell.setupSection(items: ["Visa", "Master Card", "PayPal"])
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: creditCardFormSectionId,
                                                              for: indexPath) as! CreditCardFormSection
                return cell
            }
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: addCreditCardCellId,
                                                                      for: indexPath) as! AddCreditCardSection
            let cardCell = collectionView.cellForItem(at: IndexPath(row: 1, section: 0)) as! CreditCardFormSection
            cell.collectionView.cardHolderChanged = { text in
                cardCell.collectionView.paymentCardTextFieldDidEndEditingCVC()
                self.cardHolder = text
                cardCell.collectionView.cardHolderString = self.cardHolder
            }
            cell.collectionView.cardNumberChanged = { text in
                cardCell.collectionView.paymentCardTextFieldDidEndEditingCVC()
                self.cardNumber = text
                cardCell.collectionView.paymentCardTextFieldDidChange(cardNumber: self.cardNumber, expirationYear: self.expiryYear, expirationMonth: self.expiryMonth, cvc: self.cvv)
            }
            cell.collectionView.expiryChanged = { text in
                cardCell.collectionView.paymentCardTextFieldDidEndEditingCVC()
                self.expiryMonth = UInt(text.prefix(2)) ?? 0
                self.expiryYear = UInt(text.suffix(2)) ?? 0
                cardCell.collectionView.paymentCardTextFieldDidChange(cardNumber: self.cardNumber, expirationYear: self.expiryYear, expirationMonth: self.expiryMonth, cvc: self.cvv)
            }
            cell.collectionView.cvvChanged = { text in
                self.cvv = text
                cardCell.collectionView.paymentCardTextFieldDidBeginEditingCVC()
                cardCell.collectionView.paymentCardTextFieldDidChange(cardNumber: self.cardNumber, expirationYear: self.expiryYear, expirationMonth: self.expiryMonth, cvc: self.cvv)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.rowTapped?(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                return CGSize(width: width,
                              height: 52)
            } else {
                return CGSize(width: width,
                              height: 234)
            }
        default:
            return CGSize(width: width,
                          height: 318)
        }
    }

    // MARK: - CollectionView Header
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
            case 0:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                 withReuseIdentifier: "headerId",
                                                                                 for: indexPath)  as! BasketHeader
                headerView.loadHeader("Payment", actionTitle: "Order number is 4839200012")
                return headerView

            default:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                   withReuseIdentifier: "sectionHeaderId",
                                   for: indexPath)  as! SectionHeader
                headerView.isUserInteractionEnabled = true
                headerView.buttonTapped = {
                    let cell = collectionView.cellForItem(at: IndexPath(row: 0, section: 1)) as! AddCreditCardSection
                    cell.collectionView.clearAll()
                    let cardCell = collectionView.cellForItem(at: IndexPath(row: 1, section: 0)) as! CreditCardFormSection
                    cardCell.collectionView.paymentCardTextFieldDidChange(cardNumber: "", expirationYear: 0, expirationMonth: 0, cvc: "")
                }
                headerView.loadHeader("Credit Card", actionTitle: "Clear All")
                return headerView

            }
        default:
            fatalError("Unexpected element kind")
        }
    }


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.size.width, height: 72)
        default:
            return CGSize(width: collectionView.frame.size.width, height: 60)
        }
    }
}

