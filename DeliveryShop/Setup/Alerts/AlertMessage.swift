//
//  AlertMessage.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import Foundation

class AlertMessage: Error {
    
    // MARK: - Vars & Lets
    
    var title = ""
    var body = ""
    
    // MARK: - Intialization
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
