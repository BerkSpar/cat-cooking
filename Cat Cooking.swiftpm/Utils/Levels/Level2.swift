//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level2: GameLevel {
    let enableChocolate = false
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked), type: .type2, image: "Cat2Full"),
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked), type: .type2, image: "Cat2Full")
    ]
}
