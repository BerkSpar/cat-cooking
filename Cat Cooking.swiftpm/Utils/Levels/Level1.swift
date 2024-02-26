//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class Level1: GameLevel {
    var phrasesPre = [
        "Welcome! I'm Tommas",
        "I need your help to make some cookies",
        "You need to drag the blocks to the recipe",
        "Let's go!"
    ]
    
    var phrasesPos = [
        "Whew, you made it",
        "But we still have a lot of work to do"
    ]
    
    let enableChocolate = false
    let enableReturnToStart = false
    let enableIfCondition = false
    
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .baked)),
        Cat(cookie: Cookie(state: .baked))
    ]
}
