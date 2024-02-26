//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level2: GameLevel {
    var phrasesPre = [
        "Teremos muitos clientes hoje",
        "Ainda bem que lembrei que tenho uma carta na manga",
        "Você pode usar \"Go to start\" para criar um loop na receita",
        "Toda ver que a receita chegar em \"Go to start\" ela voltará para a primeira linha",
        "Vamos tentar?"
    ]
    
    var phrasesPos = [
        "Nossa, foram muitos cookies",
        "O \"Go to start\" te ajudou?",
        "Ele tem o poder de deixar a sua receita menor",
        "Agora vamos nos preparar para os próximos clientes"
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
