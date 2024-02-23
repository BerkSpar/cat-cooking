//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level3: GameLevel {
    var phrasesPre = [
        "O caminhão com cholate acabou de chegar",
        "Felizmente, eu ainda lembro como fazer cookies de chocolate",
        "Olha, temos alguns clientes"
    ]
    
    var phrasesPos = [
        "Aeee!",
        "Aeee2!",
        "Sempre é bom adoçar a vida com um pouco de chocolate!"
    ]
    
    let enableChocolate = true
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked, hasChocolate: true)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2Full")
    ]
}
