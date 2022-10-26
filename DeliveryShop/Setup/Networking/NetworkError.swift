//
//  NetworkError.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation

class NetworkError: Codable {
    let message: String
    let key: String?
}
