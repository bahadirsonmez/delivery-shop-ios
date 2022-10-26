//
//  Constants.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

struct Constants {
    static let cornerRadius: CGFloat = 12.0
    static let eventViewCellCornerRadius: CGFloat = 20.0
    static let sidePadding: CGFloat = 20.0
    static let bottomPadding: CGFloat = 20.0
    static let buttonHeight: CGFloat = 60.0
    static let zeroInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    static let paddingZero: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    static let buttonSize: CGSize = .init(width: 0, height: Constants.buttonHeight)
    static let bottom20: UIEdgeInsets = .init(top: 0, left: 20, bottom: 20, right: 20)
    static let retakeButton: CGSize = .init(width: 160, height: 50)
    static let fity50: CGSize = .init(width: 50.0, height: 50.0)
    static let selectPhotoButton: CGSize = .init(width: 143, height: 50)
    static let zero: CGFloat = 0.0
    static let leftRightPadding: UIEdgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
    static let checkListIconSize: CGSize = .init(width: 48, height: 48)
    
    enum CoordinatorKeys: String {
        case dashboardCoordinator
        case searchCoordinator
        case accountCoordinator
    }
    
    struct AppConstants {
        static let timeZone = "Europe/Istanbul"
    }
    
    
    // MARK: - CollectionView Cell Identifiers
    struct CellIdentifiers {
        //static let categoryCellID = "categoryCellID"#imageLiteral(resourceName: "simulator_screenshot_BCFB6A8A-00C4-4D01-BA8A-5F790CD9270B.png")
        static let accountStatementCellID = "accountStatementCellID"
        static let accountStatementFooterID = "accountStatementFooterID"
    }
    
    // MARK: - CollectionView Header Identifiers
    struct HeaderIdentifiers {
        //static let dashboardHeaderID = "dashboardHeaderID"
    }
    
    struct BasicCell {
        // BOLOMIO
        static let campaignCellHeight: CGFloat = 240.0
        
        static let leftCellIcon: CGSize = CGSize(width: 25, height: 25)
        static let innerCellIcon: CGSize = CGSize(width: 16, height: 16)
        static let rightCellIcon: CGSize = CGSize(width: 7, height: 13)
        static let seperator: CGSize = CGSize(width: 0, height: 1)
        
        static let padding: CGFloat = 20.0
        static let backgroundColor = UIColor.white
        
        static let tickIcon = UIImage(named: "tick")
        static let nextImage = UIImage(named: "nextImage")
        
        static let minLineSpacing: CGFloat = 8
        static let cellHeight: CGFloat = 80
        static let headerHeight: CGFloat = 40
        static let sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let paymentSectionInset: UIEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        static let sectionInsetZero: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
        static let headerID: String = "headerId"
        static let cellID: String = "cellId"
    }
    
    // MARK: - CollectionView Cell Size
    struct CellSize {
        static let basicCellSize: CGSize = CGSize(width: 0, height: 45)
        
        static let verticalCellSize: CGSize = CGSize(width: 120.0, height: 308)
        static let horizontalCellSize: CGSize = CGSize(width: 0.0, height: 0.0)
        
        static let photoCellSize: CGSize = CGSize(width: 167.0, height: 85.0)
        
        // MARK: - Movie CollectionView Cell Size
        static let movieVerticalCellSize: CGSize = CGSize(width: 167.0, height: 272.0)
        static let movieHorizontalCellSize: CGSize = CGSize(width: 0.0, height: 0.0)
        
        // MARK: - Movie Detail Page
        static let moviePlayerCellSize: CGSize = CGSize(width: 167.0, height: 272.0)
        static let movieDetailCellSize: CGSize = CGSize(width: 167.0, height: 272.0)
    }
    
    // MARK: - CollectionView Header Size
    struct HeaderSize {
        static let profileHeader: CGSize = CGSize(width: 0, height: 120)
        static let productHeader: CGSize = CGSize(width: 0, height: 290)
    }
    
    // MARK: - Font Sizes
    struct FontSizes {
        static let large: CGFloat = 14.0
        static let small: CGFloat = 10.0
    }

    struct Shadows {
        static let shadowOffset: CGSize = CGSize(width: 0, height: 16)
        static let shadowColor: UIColor = .black
        static let shadowOpacity: Float = 0.2
        static let shadowRadius: CGFloat = 8
    }

    
    
    
    
    // MARK: - Font Sizes
    struct Fonts {
        static let font0: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 14)!
        static let font0b: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 14)! // harfların arası açık olacak.
        static let font0bn: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 14)!
        static let font1: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 16)!
        static let font1b: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 16)!
        static let font2: UIFont = UIFont(name: "SFProDisplay-Regular", size: 20)!
        static let font2b: UIFont = UIFont(name: "SFProDisplay-Bold", size: 20)!
        static let font3b: UIFont = UIFont(name: "SFProDisplay-Bold", size: 24)!
        static let font4b: UIFont = UIFont(name: "SFProDisplay-Bold", size: 32)!
        static let fontN1: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 12)!
        static let fontN1b: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 12)!
        static let fontN2: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 10)!
        static let compactDisplay: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 14)!
        
        static let titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        static let descriptionFont: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 16)!
        
        static let bigHeading: UIFont = UIFont.systemFont(ofSize: 48, weight: .bold)
        static let heading: UIFont = UIFont.systemFont(ofSize: 28, weight: .bold)
        static let body: UIFont = UIFont.systemFont(ofSize: 18, weight: .regular)
        static let smallDetail: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let smallHeader: UIFont = UIFont.systemFont(ofSize: 13, weight: .regular)
        static let middleHeader: UIFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        static let timerLabel: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 14)!
        static let buttonFont: UIFont = UIFont(name: "SFProDisplay-Bold", size: 20)!
        
        static let light14: UIFont = UIFont.systemFont(ofSize: 14, weight: .light)
        static let light16: UIFont = UIFont.systemFont(ofSize: 14, weight: .light)
        static let regular13: UIFont = UIFont.systemFont(ofSize: 13, weight: .regular)
        static let regular14: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let regular16: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let medium10: UIFont = UIFont.systemFont(ofSize: 10, weight: .medium)
        static let medium12: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium)
        static let medium14: UIFont = UIFont.systemFont(ofSize: 14, weight: .medium)
        static let medium17: UIFont = UIFont.systemFont(ofSize: 17, weight: .medium)
        static let medium32: UIFont = UIFont.systemFont(ofSize: 32, weight: .medium)
        static let semibold24: UIFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
        static let bold10: UIFont = UIFont.systemFont(ofSize: 10, weight: .bold)
        static let bold14: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        static let bold18: UIFont = UIFont.systemFont(ofSize: 18, weight: .bold)
        static let bold20: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let bold24: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let bold30: UIFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        static let bold32: UIFont = UIFont.systemFont(ofSize: 32, weight: .bold)
        
        // MARK: - ProductCard
        static let carouselDetail: UIFont = UIFont.systemFont(ofSize: 8, weight: .regular)
        static let smallGrayDetail: UIFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        static let productCardTitle: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let productCardText: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let productCardBoldText: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        static let greenButtonFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let badgeFont: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        static let badgeFontRegular: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let rentDetailFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let Reg10Font: UIFont = UIFont.systemFont(ofSize: 10, weight: .regular)
        static let Reg14Font: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let Reg17Font: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        static let Bold16Font: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let Bold17Font: UIFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        
        // MARK: - Rent
        static let greenButton: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let totalLabelFont: UIFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let smallDetailCompactDisplay: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let compactDetailDisplay: UIFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        static let compactDetailBoldDisplay: UIFont = UIFont.systemFont(ofSize: 14, weight: .bold)
        static let mini: UIFont = UIFont.systemFont(ofSize: 9, weight: .bold)

        static let compactTitleFont: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 16)!
        static let headerLabelFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        // MARK: - Profile
        static let profileBadgeFont: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 9)!
        static let compactBoldTitleFont: UIFont = UIFont(name: "SFCompactDisplay-Bold", size: 16)!
        
        // MARK: - Filter
        static let filterDescriptionLabel: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 16)!
        static let grayBorderedButton: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 14)!
        static let filterButton: UIFont = UIFont(name: "SFCompactDisplay-Regular", size: 12)!
    }
    
    struct Images {
        static let loginBackground = UIImage(named: "login_background")
        static let loginImage = UIImage(named: "login_image")
    }
    struct Constraints {
        static let mainLeading: CGFloat = 20.0
        static let mainTrailing: CGFloat = 20.0
        static let padding: CGFloat = 20.0
        
        static let krokiImage: CGSize = CGSize(width: 300, height: 390)
        static let areaCornerButton: CGSize = CGSize(width: 80, height: 130)
        static let areaTopBottomButton: CGSize = CGSize(width: 140, height: 130)
        static let areaMiddleButton: CGSize = CGSize(width: 100, height: 150)
        
        static let buttonHeight: CGSize = CGSize(width: 300, height: 44)
        static let checkboxSize: CGSize = CGSize(width: 28, height: 28)
        static let checkboxImageInset: UIEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
    struct BorderRadius {
        static let buttonBorderRad = 10.0
        static let buttonBorderWidth = 1.0
    }
    
    // MARK: - SegueIdentifiers
    struct SegueIdentifiers {
        static let movieDetailSegue = ""
        static let playMovieSeque = ""
        static let searchSegue = ""
        static let accountSeque = ""
    }
    
    // MARK: - Animation Durations
    struct AnimationDurations {
        static let fast: TimeInterval = 1.0
        static let medium: TimeInterval = 3.0
        static let slow: TimeInterval = 5.0
    }
    
    static let notification = UIImage(systemName: "bell.badge.fill")?.withRenderingMode(.alwaysOriginal)
    
    struct CellImages {
        // AccountView
        static let menuImages = [/*"newProfile",*/
                                 "logoutIcon",
                                 "newCarIcon",
                                 "newFaqIcon",
                                 "serviceArea",
                                 "newAirportIcon",
                                 "freeParksIcon",
                                 "newCarsIcon",
                                 "newInviteIcon",
                                 "newContactIcon",
                                 "settingsIcon",
                                 "newAboutUsIcon"]
        // UserAccountView
        static let accountImages = ["membershipIcon",
                                    "creditCardIconNew",
                                    "historyIcon",
                                    "agreementIcon",
                                    "driverLicenceIcon",
                                    /*"emailIcon",*/
                                    "logoutIcon"]
        // AccountDetailsView
        static let accountDetailImages = ["detailsUserIcon",
                                    "agreementIcon",
                                    "driverLicenceIcon",
                                    "accountVideoIcon",
                                    "emailIcon"]
        
        static let accountInfo = "membershipIcon"
        static let paymentMethods = "creditCardIconNew"
        static let rentHistory = "historyIcon"
        static let contract = "agreementIcon"
        static let updateLicense = "driverLicenceIcon"
        static let logout = "logoutIcon"
        
        // PaymentOptionsView
        static let options = "membershipIcon"
        static let history = "historyIcon"
        
        // PaymentProfileListView
        static let addPayment = "creditCardIconNew"
        static let address = "locationIcon"
        
        // AddPaymentView
        static let addCard = "add_credit_card"
        static let selectCard = "credit"
        static let addAddress = "location_dark"
        static let selectAddress = "map-icon"
    }
}
