//
//  Bundle+Extension.swift
//  DeliveryShop
//
//  Created by ssaylanc on 18.01.2021.
//

import UIKit

var bundleKey: UInt8 = 0

class AnyLanguageBundle: Bundle {
    override func localizedString(forKey key: String,
                                  value: String?,
                                  table tableName: String?) -> String {
        guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
            let bundle = Bundle(path: path) else {
                return super.localizedString(forKey: key, value: value, table: tableName)
        }
        return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    
    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }
    
    var bundleId: String {
        return bundleIdentifier!
    }
    
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    var buildNumber: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
    
    
    class func setLanguage(_ language: String) {
        defer {
            object_setClass(Bundle.main, AnyLanguageBundle.self)
        }
        objc_setAssociatedObject(Bundle.main, &bundleKey,    Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}

extension Bundle {
    /// Create a new Bundle instance for 'Image.xcassets'.
    ///
    /// - Returns: a new bundle which contains 'Image.xcassets'.
    static func currentBundle() -> Bundle {
        let bundle = Bundle(for: CreditCardPreviewSection.self)
        if let path = bundle.path(forResource: "CreditCardForm", ofType: "bundle") {
            return Bundle(path: path)!
        } else {
            return bundle
        }
    }
}
