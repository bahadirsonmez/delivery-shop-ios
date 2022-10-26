//
//  CampaignsViewModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

class CampaignsViewModel: NSObject {
    let manager: CampaignsAPIManager
    
    init(manager: CampaignsAPIManager) {
        self.manager = manager
        super.init()
    }
}
