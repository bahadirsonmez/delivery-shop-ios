//
//  Validator.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 7.02.2021.
//
import UIKit

enum ValidatorType
{
    case email
    case name
    case password
    case phone
    case otpCode
    // add more cases ...
}

enum ValidationError: Error, LocalizedError
{
    case invalidUserName
    case invalidEmail
    case invalidPassword
    case invalidPhone
    case invalidCode

    var localizedDescription: String
    {
        switch self
        {
        case .invalidEmail:
            return "Geçersiz email"
        case .invalidUserName:
            return "Lütfen isminizi yazınız"
        case .invalidPassword:
            return "Parolanız 6 karakterden uzun olmalı"
        case .invalidPhone:
            return "Geçersiz telefon numarası"
        case .invalidCode:
            return "Geçersiz kod"
        }
    }
}

extension String
{
    // MARK:- Properties

    var isValidEmail: Bool
    {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }

    // MARK:- Methods

    func validatedText(_ validationType: ValidatorType) throws
    {
        switch validationType
        {
        case .name:
            try validateUsername()
        case .email:
            try validateEmail()
        case .password:
            try validatePassword()
        case .phone:
            try validatePhone()
        case .otpCode:
            try validateCode()
        }
    }

    // MARK:- Private Methods

    private func validateUsername() throws
    {
        if isEmpty
        {
            throw ValidationError.invalidUserName
        }
    }
    private func validateEmail() throws
    {
        if !isValidEmail
        {
            throw ValidationError.invalidEmail
        }
    }
    private func validatePassword() throws
    {
        if count < 6
        {
            throw ValidationError.invalidPassword
        }
    }
    private func validatePhone() throws
    {
        if count < 10
        {
            throw ValidationError.invalidPhone
        }
    }
    private func validateCode() throws
    {
        if count != 5
        {
            throw ValidationError.invalidCode
        }
    }
}
