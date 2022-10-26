//
//  CreditCardPreviewView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 12.02.2021.
//
import UIKit

class CreditCardPreviewSection: BaseCell, SetupCodeView {

    lazy var collectionView = CreditCardPreviewView()

    override func setupViews() {
        setupView()
    }
    func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    func setupConstraints() {
        collectionView.fillSuperview()
    }

    func setupAdditionalConfiguration() {
    }
}

class CreditCardPreviewView: BaseView {
    private let spacing:CGFloat = 12.0

    var safeArea = UILayoutGuide()
    let trendingCellHeight: CGFloat = 68
    let cellHeight: CGFloat = 90.0
    let headerHeight: CGFloat = 240.0
    let creditCellId = "creditCardCellId"

    var rowTapped : ((Int) -> Void)?

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = colors.mainTextColor
        view.cornerRadius = 6
        return view
    }()

    lazy var cardImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "visa")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()

    lazy var cardType: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.light14, textAlignment: .right, textColor: .white))
        label.text = "Visa Electron"
        return label
    }()

    lazy var cardNumber: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.semibold24, textColor: .white))
        label.text = "**** **** **** **** 6280"
        return label
    }()

    lazy var cardholderName: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.light14, textColor: .white))
        label.text = "Card Holder: Monika Willems"
        return label
    }()

    lazy var expiryDate: UILabel = {
        let label = UILabel()
        label.apply(style: .init(font: fonts.light14, textColor: .white))
        label.text = "Expires: "
        return label
    }()

    lazy var isPreferredImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.image =  UIImage(named: "selected-button")
        return iv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")

    }

    func loadView(cardItem: CreditCardModel) {
        DispatchQueue.main.async {
            self.cardNumber.text = cardItem.cardNumber
            self.cardholderName.text = "Card Holder: " + cardItem.cardHolderName
            self.expiryDate.text = "Expires: " + cardItem.expiryDate
            switch cardItem.cardType {
            case .visa:
                self.cardType.text = "Visa Electron"
            case .mastercard:
                self.cardType.text = "Mastercard"
            default:
                self.cardType.text = "PayPal"
            }
        }
    }
}

extension CreditCardPreviewView: SetupCodeView {
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubviews(cardImage ,cardType, cardNumber, cardholderName,
                                  expiryDate, isPreferredImage)
    }

    func setupConstraints() {
        containerView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 20, right: 20)
        )
        cardImage.anchor(
            top: containerView.topAnchor,
            leading: containerView.leadingAnchor,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0),
            size: .init(width: 48, height: 16)
        )
        cardType.anchor(
            top: containerView.topAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 25, left: 0, bottom: 0, right: 20)
        )
        cardNumber.centerView(to: containerView)
        cardholderName.anchor(
            leading: containerView.leadingAnchor,
            bottom: expiryDate.topAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 0)
        )
        expiryDate.anchor(
            leading: containerView.leadingAnchor,
            bottom: containerView.bottomAnchor,
            padding: .init(top: 0, left: 20, bottom: 20, right: 0)
        )
        isPreferredImage.anchor(
            bottom: containerView.bottomAnchor,
            trailing: containerView.trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 20, right: 20),
            size: .init(width: 44, height: 44)
        )
    }

    func setupAdditionalConfiguration() {

    }
}
