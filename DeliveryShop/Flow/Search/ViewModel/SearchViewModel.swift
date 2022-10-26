//
//  WalletViewModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

class SearchViewModel: NSObject {
    let manager: SearchAPIManager
    
    init(manager: SearchAPIManager) {
        self.manager = manager
        super.init()
    }
}
