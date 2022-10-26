//
//  OTPTextField.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 8.02.2021.
//
import UIKit

class OTPTextField: UITextField {

    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?

    override public func deleteBackward(){
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}
