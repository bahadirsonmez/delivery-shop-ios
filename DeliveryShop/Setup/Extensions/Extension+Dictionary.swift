//
//  Extension+Dictionary.swift
//  bolomio
//
//  Created by ssaylanc on 13.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation

extension Dictionary {
    func encodeForHTTPBody() -> Data {
        let data = try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        if let json = json {
            print("HTTPBody: \(json)")
        }
        
        return json!.data(using: String.Encoding.utf8.rawValue)!;
    }
    
    var jsonStringRepresentation: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
            return nil
        }

        return String(data: theJSONData, encoding: .utf8)
    }
}
