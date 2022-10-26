//
//  File.swift
//  bolomio
//
//  Created by ssaylanc on 13.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation

class AccountViewModel: NSObject {
    let manager: AccountAPIManager
    
    init(manager: AccountAPIManager) {
        self.manager = manager
        super.init()
    }
}
