//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level3: GameLevel {
    var phrasesPre = [
        "O carregamento de cholate acabou de chegar",
        "Felizmente, eu ainda lembro como fazer cookies de chocolate",
        "Basta \"adicionar chocolate\" após \"Cook Cookie\"",
        "Olha, temos alguns clientes"
    ]
    
    var phrasesPos = [
        "Muito bem! Você é realmente bom",
        "O cheirinho de chocolate é muito gostoso",
        "Veja está atraindo mais clientes"
    ]
    
    let enableChocolate = true
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked, hasChocolate: true)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2Full")
    ]
}
