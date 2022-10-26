//
//  UserDefaultHelper.swift
//  bolomio
//
//  Created by ssaylanc on 25.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

private enum Defaults: String {
    case eventLink = "eventLink"
    case selectedEvent = "selectedEvent"
    case selectedEventLocation = "selectedEventLocation"
}

final class UserDefaultHelper {
    static var eventLink: String? {
        set{
            _set(value: newValue, key: .eventLink)
        } get {
            return _get(valueForKay: .eventLink) as? String ?? ""
        }
    }
    
    static var selectedEvent: String? {
        set{
            _set(value: newValue, key: .selectedEvent)
        } get {
            return _get(valueForKay: .selectedEvent) as? String ?? "-1"
        }
    }

    static var selectedEventLocation: String? {
        set{
            _set(value: newValue, key: .selectedEventLocation)
        } get {
            return _get(valueForKay: .selectedEventLocation) as? String ?? "-1"
        }
    }

    static func deleteEventLink() {
         UserDefaults.standard.removeObject(forKey: Defaults.eventLink.rawValue)
    }
    
    static func deleteSelectedEvent() {
         UserDefaults.standard.removeObject(forKey: Defaults.selectedEvent.rawValue)
    }

    static func deleteSelectedEventLocation() {
         UserDefaults.standard.removeObject(forKey: Defaults.selectedEventLocation.rawValue)
    }


    static func deletaAll() {
        deleteEventLink()
        deleteSelectedEvent()
        deleteSelectedEventLocation()
    }
}

extension UserDefaultHelper {
    private static func _set(value: Any?, key: Defaults) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    private static func _get(valueForKay key: Defaults)-> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
