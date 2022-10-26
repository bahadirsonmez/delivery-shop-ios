//
//  Float+Extension.swift
//  bolomio
//
//  Created by ssaylanc on 26.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation

extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
