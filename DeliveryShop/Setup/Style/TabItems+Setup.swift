//
//  Constants+Tab.swift
//  DeliveryShop
//
//  Created by ssaylanc on 19.01.2021.
//

import Foundation

extension Constants {
    // MARK: - Tabbar Images && Titles
    struct Tab {
        static let tab0Title = "".localized()
        static let tab1Title = "".localized()
        static let tab2Title = "".localized()
        static let tab3Title = "".localized()
        static let tab4Title = "".localized()
        
        //static let home = UIImage(systemName: "homekit")?.withRenderingMode(.alwaysOriginal) // -> böyle olursa seçilince rengi değişmiyor.
        static let tab0 = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.gray30)
        static let tab0Selected = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.barTintColor)
        
        static let tab1 = UIImage(systemName: "square.grid.2x2.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.gray30)
        static let tab1Selected = UIImage(systemName: "square.grid.2x2.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.barTintColor)
        
        static let tab2 = UIImage(systemName: "cart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.gray30)
        static let tab2Selected = UIImage(systemName: "cart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.barTintColor)
        
        static let tab3 = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.gray30)
        static let tab3Selected = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.barTintColor)
        
        static let tab4 = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.gray30)
        static let tab4Selected = UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(Constants.Colors.barTintColor)
    }
}
