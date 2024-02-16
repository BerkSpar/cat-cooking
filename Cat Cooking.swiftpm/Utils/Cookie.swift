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

struct Cookie: Equatable {
    var state: CookieState = .raw
    var hasChocolate: Bool = false
    
    func getImage() -> String {
        if state == .burnt {
            return "BurntCookie"
        }
        
        return hasChocolate ? "ChocolateCookie" : "RawCookie"
    }
    
    public static func ==(lhs: Cookie, rhs: Cookie) -> Bool {
        return
            lhs.state == rhs.state &&
            lhs.hasChocolate == rhs.hasChocolate
    }
}
