//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level1: GameLevel {
    var phrasesPre = [
        "Bem-vindo! eu sou o Tommas",
        "Eu preciso da sua ajuda para fazer alguns cookies",
        "Você precisa arrastar os blocos até a receita",
        "Vamos nessa!"
    ]
    
    var phrasesPos = [
        "Ufa, você conseguiu",
        "Mas ainda temos muito trabalho pela frente"
    ]
    
    let enableChocolate = false
    let enableReturnToStart = false
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked))
    ]
}
