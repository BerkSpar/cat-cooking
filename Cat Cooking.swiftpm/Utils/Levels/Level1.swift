//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level1: GameLevel {
    let enableChocolate = false
    let enableReturnToStart = false
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked))
    ]
}
