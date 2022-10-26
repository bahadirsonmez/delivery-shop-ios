//
//  EventViewModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

class BasketViewModel: NSObject {
    let manager: BasketAPIManager
    
    var isLoading: ((Bool) -> ())?
    //var events: Events?
    //var eventDetail: EventItem?
    
    init(manager: BasketAPIManager) {
        self.manager = manager
        super.init()
    }
    
    func getBasket(success: @escaping () -> Void,
                   failure: @escaping (APIError) -> Void) {
        self.isLoading?(true)
        manager.call(router: BasketRouter.getEventList) { (result: Result<Events, APIError>) in
            switch result {
            case .success(let data):
                self.isLoading?(false)
                //self.events = data
                print(data)
                success()
            case .failure(let alert):
                self.isLoading?(false)
                failure(alert)
            }
        }
    }
}

//struct EventItemModel {
//    var event: EventItem
//
//    var name: String {
//        guard let name = event.name else { return "name boş"}
//        return name
//    }
//    var coverImage: String {
//        guard let url = event.coverImage else {return ""}
//        return url
//    }
//    var startDate: String {
//        guard let date = event.startDate else {return ""}
//        return date
//    }
//    var inviteeCount: Int {
//        guard let count = event.inviteeCount else {return -1}
//        return count
//    }
//    var rejectedCount: Int {
//        guard let count = event.inviteeRejectedCount else {return -1}
//        return count
//    }
//    var acceptedCount: Int {
//        guard let count = event.inviteeAcceptedCount else {return -1}
//        return count
//    }
//    var wishAmount: String {
//        guard let amount = event.wishAmount?.clean else {return "-1"}
//        return amount
//    }
//}
