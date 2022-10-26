//
//  AppColors+Setup.swift
//  DeliveryShop
//
//  Created by ssaylanc on 19.01.2021.
//

import Foundation

extension Constants {
    struct Radius {
        static let corner: CGFloat = 6
    }
    
    // MARK: - App Colors
    struct Colors {
        static let barTintColor = UIColor.systemBlue
        
        // View Background Color
        static let backgroundColor = UIColor.white
        
        // Gray color
        static let gray = UIColor(rgba: "#F6F6F6")
        static let gray30 = UIColor(rgba: "#D0D0D0")
        static let grayButtonBorder = UIColor(rgba: "#E6E6E7")

        static let orangeColor = UIColor(rgba: "#FFA601")
        
        // Text Colors
        static let mainTextColor = UIColor(rgba: "#2D2D2F")
        static let secondaryTextColor = UIColor(rgba: "#8D8D8E")
        static let blueTextColor = UIColor(rgba: "#2967FF")

        static let iconButtonBackgroundColor = UIColor(rgba: "#FAFAFF")
        static let eventDetailBadgeBackgroundColor = UIColor(rgba: "#FFDB9D")
        static let eventDetailImageBackgroundColor = UIColor(rgba: "#F4C06C")

        static let bolomio = UIColor(rgba: "#C8435F")
        static let mainColor = UIColor(rgba: "#008489")
        static let lightTextColor = UIColor(rgba: "#A1A4B2")
        static let grayTextColor = UIColor(rgba: "#4F4F4F")
        static let eventPageTextColor = UIColor(rgba: "#050506")
        
        static let softBG = UIColor(rgba: "#F3F5F9")
        static let dimmedText = UIColor(rgba: "#232326").withAlphaComponent(0.5)

        static let attendedBackgroundColor = UIColor(rgba: "#E6FCF4")
        static let attendedTextColor = UIColor(rgba: "#07E092")
        static let notAttendedBackgroundColor = UIColor(rgba: "#FFEFF1")
        static let notAttendedTextColor = UIColor(rgba: "#FD5B71")
        static let unknownBackgroundColor = UIColor(rgba: "#FEF5ED")
        static let unknownTextColor = UIColor(rgba: "#FFA656")
    }
}
