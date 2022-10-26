//
//  PaymentViewModel.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 12.02.2021.
//
import Foundation

class PaymentViewModel: NSObject {
    let manager: MainAPIManager

    init(manager: MainAPIManager) {
        self.manager = manager
        super.init()
    }
}
