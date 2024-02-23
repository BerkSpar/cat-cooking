//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level1: GameLevel {
    var phrasesPre = [
        "Bem vindo! Meu nome é Tommas e sou um gatinho cozinheiro",
        "Eu preciso da sua ajuda para fazer alguns cookies",
        "Você pode me ajudar?"
    ]
    
    var phrasesPos = [
        "Ahhhh que alivio",
        "Eu sabia que podia contar com você!"
    ]
    
    let enableChocolate = false
    let enableReturnToStart = false
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked))
    ]
}
