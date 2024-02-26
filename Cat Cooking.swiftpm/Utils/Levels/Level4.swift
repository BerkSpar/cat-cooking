//
//  File.swift
//
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level4: GameLevel {
    var phrasesPre = [
        "Estamos chegando ao final do expediente",
        "Está ficando cade vez mais dificil",
        "Preste atenção na próxima receita, ela pode ser um pouco mais complicada",
        "Os clientes estão ficando exigentes!"
    ]
    
    var phrasesPos = [
        "UHUUUL! Você fez ótimas receitas durante a sua jornada na cozinha",
        "Além de me ajudar em fazer cookies, voce aprendeu alguns conceitos comuns de programação",
        "As receitas são algoritmos que tem inicio, meio e fim",
        "E quando são seguidas passo a passo, chegam sempre no mesmo resultado",
        "Foi legal relembrar algumas receitas com você",
        "Até a proxima!",
        "Miau"
    ]
    
    let enableChocolate = true
    let enableReturnToStart = true
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked, hasChocolate: true)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: false)),
        Cat(cookie: Cookie(state: .baked, hasChocolate: true), type: .type2, image: "Cat2Full"),
        Cat(cookie: Cookie(state: .baked, hasChocolate: false), type: .type2, image: "Cat2Full"),
    ]
}
