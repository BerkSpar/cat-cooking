//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

enum CookieState {
    case raw
    case baked
    case burnt
}

struct Cookie {
    var state: CookieState = .raw
    var hasChocolate: Bool = false
}
