//
//  File.swift
//
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level4: GameLevel {
    var phrasesPre = [
        "We're coming to the end of working hours",
        "It's getting harder and harder",
        "Pay attention to the next recipe, it might be a bit more complicated",
        "Customers are getting demanding!"
    ]
    
    var phrasesPos = [
        "",
        "",
        "",
        "WOW! You've made some great recipes during your journey in the kitchen",
        "In addition to helping me make cookies, you learned some common programming concepts",
        "Recipes are algorithms that have a beginning, middle and end",
        "And when they are followed step by step, they always arrive at the same result",
        "It was nice to remember some recipes with you",
        "See you next time!",
        "Meow"
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
