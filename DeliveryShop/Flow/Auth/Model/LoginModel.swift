//
//  LoginModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

struct LoginResponse: Codable {
    
    let token : String?
    let membership : Membership?

    enum CodingKeys: String, CodingKey {
        case token = "token"
        case membership = "membership"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
        membership = try values.decodeIfPresent(Membership.self, forKey: .membership)
    }
    
}

struct Membership : Codable {

    let createdAt : String?
    let createdBy : String?
    //let data : Data?
    let dateJoined : String?
    let email : String?
    let firstName : String?
    let id : Int?
    let image : String?
    let isActive : Bool?
    let lastLogin : String?
    let lastName : String?
    let phone : String?
    let smsNotification : Bool?
    let user : Int?
    let userId : Int?


    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case createdBy = "created_by"
        //case data
        case dateJoined = "date_joined"
        case email = "email"
        case firstName = "first_name"
        case id = "id"
        case image = "image"
        case isActive = "is_active"
        case lastLogin = "last_login"
        case lastName = "last_name"
        case phone = "phone"
        case smsNotification = "sms_notification"
        case user = "user"
        case userId = "user_id"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        createdBy = try values.decodeIfPresent(String.self, forKey: .createdBy)
        //data = try Data(from: decoder)
        dateJoined = try values.decodeIfPresent(String.self, forKey: .dateJoined)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        lastLogin = try values.decodeIfPresent(String.self, forKey: .lastLogin)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        smsNotification = try values.decodeIfPresent(Bool.self, forKey: .smsNotification)
        user = try values.decodeIfPresent(Int.self, forKey: .user)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
    }


}

//struct Data : Codable {
//
//    enum CodingKeys: String, CodingKey {
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//    }
//}
