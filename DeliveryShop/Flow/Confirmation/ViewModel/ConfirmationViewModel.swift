//
//  ConfirmationViewModel.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 16.02.2021.
//
import Foundation

class ConfirmationViewModel: NSObject {
    let manager: MainAPIManager

    init(manager: MainAPIManager) {
        self.manager = manager
        super.init()
    }
}
