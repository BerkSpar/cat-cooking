//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level3: GameLevel {
    var phrasesPre = [
        "The chocolate shipment just arrived",
        "Fortunately, I still remember how to make chocolate cookies",
        "Just \"add chocolate\" after \"cook cookie\"",
        "Look, we have some customers"
    ]
    
    var phrasesPos = [
        "",
        "",
        "Well done! You're really good",
        "The smell of chocolate is very tasty",
        "You're attracting more customers"
    ]
    
    let enableChocolate = true
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked, hasChocolate: true)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2Full")
    ]
}
