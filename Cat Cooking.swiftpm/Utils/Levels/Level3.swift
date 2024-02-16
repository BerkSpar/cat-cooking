//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level3: GameLevel {
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2"),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2"),
    ]
}
