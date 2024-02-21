//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

enum CatType {
    case type1
    case type2
    case type3
}

struct Cat {
    var cookie: Cookie
    var type: CatType = .type1
    var image: String = "CatFull"
}
