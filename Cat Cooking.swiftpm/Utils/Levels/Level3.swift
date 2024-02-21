//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level3: GameLevel {
    let enableChocolate = true
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked, hasChocolate: true)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2Full")
    ]
}
