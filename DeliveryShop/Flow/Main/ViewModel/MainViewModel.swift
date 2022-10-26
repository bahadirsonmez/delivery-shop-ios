//
//  DonationsViewMdeol.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

class MainViewModel: NSObject {
    let manager: MainAPIManager
    
    init(manager: MainAPIManager) {
        self.manager = manager
        super.init()
    }
}
