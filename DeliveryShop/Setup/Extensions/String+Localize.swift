//
//  String+Localize.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//
import Foundation

extension String {
    func localized(with comment: String = "") -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
    
    func localized(with comment: String = "", value: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: value, comment: comment)
    }
}
