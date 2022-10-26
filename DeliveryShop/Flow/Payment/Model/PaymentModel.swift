//
//  PaymentModel.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 23.02.2021.
//

import Foundation
enum CardType{
    case visa
    case mastercard
    case paypal
}

struct CreditCardModel {
    var cardNumber: String
    var cardHolderName: String
    var expiryDate: String
    var cvv: String
    var cardType: CardType
}
