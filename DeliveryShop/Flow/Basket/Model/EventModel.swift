//
//  EventModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

struct Events : Codable {

    let events : [EventItem]?

    enum CodingKeys: String, CodingKey {
        case events = "events"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decodeIfPresent([EventItem].self, forKey: .events)
    }
}

struct EventItem : Codable {

    let childrenAllowed : Bool?
    let coverImage : String?
    let dateIsNotClear : Bool?
    let endTime : String?
    let eventPerson : [EventPerson]?
    let eventType : EventType?
    let id : String?
    let inviteeAcceptedCount : Int?
    let inviteeCount : Int?
    let inviteeRejectedCount : Int?
    let isOpenToEveryone : Bool?
    let location : Location?
    let name : String?
    let parentEvent : String?
    let socials : [String]?
    let startDate : String?
    let startTime : String?
    let timeIsNotClear : Bool?
    let url : String?
    let welcomingImage : String?
    let welcomingMessage : String?
    let wishAmount : Float?
    let wishImage : String?
    let wishMessage : String?


    enum CodingKeys: String, CodingKey {
        case childrenAllowed = "children_allowed"
        case coverImage = "cover_image"
        case dateIsNotClear = "date_is_not_clear"
        case endTime = "end_time"
        case eventPerson = "event_person"
        case eventType = "event_type"
        case id = "id"
        case inviteeAcceptedCount = "invitee_accepted_count"
        case inviteeCount = "invitee_count"
        case inviteeRejectedCount = "invitee_rejected_count"
        case isOpenToEveryone = "is_open_to_everyone"
        case location
        case name = "name"
        case parentEvent = "parent_event"
        case socials = "socials"
        case startDate = "start_date"
        case startTime = "start_time"
        case timeIsNotClear = "time_is_not_clear"
        case url = "url"
        case welcomingImage = "welcoming_image"
        case welcomingMessage = "welcoming_message"
        case wishAmount = "wish_amount"
        case wishImage = "wish_image"
        case wishMessage = "wish_message"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        childrenAllowed = try values.decodeIfPresent(Bool.self, forKey: .childrenAllowed)
        coverImage = try values.decodeIfPresent(String.self, forKey: .coverImage)
        dateIsNotClear = try values.decodeIfPresent(Bool.self, forKey: .dateIsNotClear)
        endTime = try values.decodeIfPresent(String.self, forKey: .endTime)
        eventPerson = try values.decodeIfPresent([EventPerson].self, forKey: .eventPerson)
        eventType = try values.decodeIfPresent(EventType.self, forKey: .endTime)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        inviteeAcceptedCount = try values.decodeIfPresent(Int.self, forKey: .inviteeAcceptedCount)
        inviteeCount = try values.decodeIfPresent(Int.self, forKey: .inviteeCount)
        inviteeRejectedCount = try values.decodeIfPresent(Int.self, forKey: .inviteeRejectedCount)
        isOpenToEveryone = try values.decodeIfPresent(Bool.self, forKey: .isOpenToEveryone)
        location = try values.decodeIfPresent(Location.self, forKey: .location)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        parentEvent = try values.decodeIfPresent(String.self, forKey: .parentEvent)
        socials = try values.decodeIfPresent([String].self, forKey: .socials)
        startDate = try values.decodeIfPresent(String.self, forKey: .startDate)
        startTime = try values.decodeIfPresent(String.self, forKey: .startTime)
        timeIsNotClear = try values.decodeIfPresent(Bool.self, forKey: .timeIsNotClear)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        welcomingImage = try values.decodeIfPresent(String.self, forKey: .welcomingImage)
        welcomingMessage = try values.decodeIfPresent(String.self, forKey: .welcomingMessage)
        wishAmount = try values.decodeIfPresent(Float.self, forKey: .wishAmount)
        wishImage = try values.decodeIfPresent(String.self, forKey: .wishImage)
        wishMessage = try values.decodeIfPresent(String.self, forKey: .wishMessage)
    }
}

struct Location : Codable {

    let id : Int?
    let images : [String]?
    let latitude : Double?
    let longitude : Double?
    let name : String?


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "images"
        case latitude = "latitude"
        case longitude = "longitude"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

struct EventType : Codable {

    let eventTypePerson : [EventTypePerson]?
    let id : Int?
    let name : String?
    let slug : String?


    enum CodingKeys: String, CodingKey {
        case eventTypePerson = "event_type_person"
        case id = "id"
        case name = "name"
        case slug = "slug"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        eventTypePerson = try values.decodeIfPresent([EventTypePerson].self, forKey: .eventTypePerson)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
    }


}

struct EventPerson : Codable {

    let event : String?
    //let eventTypePerson : EventTypePerson?
    let id : Int?
    let name : String?


    enum CodingKeys: String, CodingKey {
        case event = "event"
        //case eventTypePerson = "event_type_person"
        case id = "id"
        case name = "name"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        event = try values.decodeIfPresent(String.self, forKey: .event)
        //eventTypePerson = try values.decodeIfPresent(EventTypePerson.self, forKey: .event)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}

struct EventTypePerson : Codable {

    let eventType : Int?
    let name : String?
    let slug : String?
    let weight : Float?


    enum CodingKeys: String, CodingKey {
        case eventType = "event_type"
        case name = "name"
        case slug = "slug"
        case weight = "weight"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        eventType = try values.decodeIfPresent(Int.self, forKey: .eventType)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        weight = try values.decodeIfPresent(Float.self, forKey: .weight)
    }
}
