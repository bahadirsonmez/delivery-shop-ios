//
//  DeliveryViewModel.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 15.02.2021.
//
import Foundation

class DeliveryViewModel: NSObject {
    let manager: MainAPIManager

    init(manager: MainAPIManager) {
        self.manager = manager
        super.init()
    }
}
