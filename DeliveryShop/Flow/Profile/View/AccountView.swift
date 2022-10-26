//
//  AccountView.swift
//  bolomio
//
//  Created by ssaylanc on 22.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

class AccountView: UIView {
    var logoutTapped: (() -> Void)?

    var safeArea = UILayoutGuide()
    let minLineSpacing = Constants.BasicCell.minLineSpacing
    let cellHeight = Constants.BasicCell.cellHeight
    let headerHeight = Constants.HeaderSize.profileHeader.height
    let sectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    let sectionInsetZero = Constants.BasicCell.sectionInsetZero
    let cellId = Constants.BasicCell.cellID
    let headerId = Constants.BasicCell.headerID
    let footerId = "footerId"
    
    var info: [String: String] = ["name": "Ad Soya", "email": "Email", "gsm": "Telefon", "iban": "IBAN"]
    
    var rowTapped : ((Int) -> Void)?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor(rgba: "#F6F6F6")
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

extension AccountView : SetupCodeView {
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
        collectionView.register(AccountCell.self,
                                forCellWithReuseIdentifier: cellId)
        collectionView.register(AcountHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
        collectionView.register(AccountFooter.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: footerId)
    }
}

extension AccountView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return Constants.CellTitles.accountSection1Titles.count
        case 1:
            return Constants.CellTitles.accountSection2Titles.count
        default:
            return Constants.CellTitles.accountSection3Titles.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as!  AccountCell
        switch indexPath.section {
        case 0:
            cell.setupCell(
                Constants.CellTitles.accountSection1Titles[indexPath.row]
            )
            switch indexPath.row {
            case 0:
                cell.detailLabel.text = "Monika Willems"
            case 1:
                cell.detailLabel.text = "blackcherry@gmail.com"
            case 2:
                cell.detailLabel.text = "455 Larkspur Dr. Califor..."
            case 3:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = "Visa **** **** **** 6280"
            default:
                break
            }
        case 1:
            cell.setupCell(
                Constants.CellTitles.accountSection2Titles[indexPath.row]
            )
            switch indexPath.row {
            case 0:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = "5"
            case 1:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = "3"
            case 2:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = "1 in transit"
            default:
                break
            }
        default:
            cell.setupCell(
                Constants.CellTitles.accountSection3Titles[indexPath.row]
            )
            switch indexPath.row {
            case 0:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = ""
            case 1:
                cell.cellIconRight.isHidden = false
                cell.hasRightIcon = true
                cell.detailLabel.text = ""
            default:
                break
            }
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.rowTapped?(indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: 60)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: - CollectionView Header
    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
      switch kind {
      case UICollectionView.elementKindSectionHeader:
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                           withReuseIdentifier: headerId,
                           for: indexPath)  as! AcountHeader
        headerView.setupHeader()
        return headerView
      case UICollectionView.elementKindSectionFooter:
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: footerId,
                                                                         for: indexPath)  as! AccountFooter
        footerView.setupHeader()
        footerView.logoutTapped = {
            self.logoutTapped?()
        }
        return footerView
      default:
        fatalError("Unexpected element kind")
        //assert(false, "Unexpected element kind")
      }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.size.width, height: 236)
        }else {
            return CGSize(width: collectionView.frame.size.width, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 2 {
            return CGSize(width: collectionView.frame.size.width, height: 150)
        }else {
            return CGSize(width: collectionView.frame.size.width, height: 0)
        }
    }
}
