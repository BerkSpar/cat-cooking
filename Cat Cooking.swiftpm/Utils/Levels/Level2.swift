//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level2: GameLevel {
    let phrasesPre = [
        "Eita, hoje o dia está bem cheio",
        "Chegaram mais clientes e eu posso te ajudar a deixar tudo mais fácil",
        "Use o VOLTAR PARA O COMEÇO para facilitar sua receira"
    ]
    
    var phrasesPos = [
        "Conseguiu ver que a sua receita ficou bem menor?",
        "Vi dizer que na computação eles tem algo igual"
    ]
    
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
