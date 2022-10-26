//
//  WishlistViewModel.swift
//  DeliveryShop
//
//  Created by ssaylanc on 7.02.2021.
//

import Foundation

class WishlistViewModel: NSObject {
    let manager: WhislistAPIManager
    
    init(manager: WhislistAPIManager) {
        self.manager = manager
        super.init()
    }
}
