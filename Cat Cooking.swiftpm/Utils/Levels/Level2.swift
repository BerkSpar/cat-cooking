//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level2: GameLevel {
    var phrasesPre = [
        "We'll have lots of customers",
        "I'm glad I remembered that I have an ace up my sleeve",
        "You can use \"go to start\" to create a loop in the recipe",
        "Every time the recipe reaches \"go to start\" it will go back to the first line",
        "Shall we try it?"
    ]
    
    var phrasesPos = [
        "",
        "Wow, that was a lot of cookies",
        "Did \"go to start\" help you?",
        "It has the power to make your recipe smaller",
        "Now let's get ready for the next customers"
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
