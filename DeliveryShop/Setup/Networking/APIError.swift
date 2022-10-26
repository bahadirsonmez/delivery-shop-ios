//
//  APIError.swift
//  bolomio
//
//  Created by Serdar Aylanc on 13.09.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation
import Alamofire

struct SkyErrorModel : Codable, Error {

    var result : Bool?
    var detail : String?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case detail = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(Bool.self, forKey: .result)
        detail = try values.decodeIfPresent(String.self, forKey: .detail)
    }
    
//    func getMessage() -> String? {
//        return self.detail
//    }
//    
//    func getCode() -> Int? {
//        return self.error
//    }
}

struct APIError: Error {
    let code: Int
    let message: String
    let data: AFDataResponse<Any>?
    
    init(_ code: Int, _ data: AFDataResponse<Any>?, _ message: String) {
        self.code = code
        self.data = data
        self.message = message
    }
}
