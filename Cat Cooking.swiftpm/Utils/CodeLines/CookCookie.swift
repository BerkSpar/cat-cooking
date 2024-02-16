//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class CookCookie: CodeLine {
    let name = "Cook Cookie"
    
    func run(_ state: GameState) {
        if state.cookie?.state == .baked {
            state.wrongCookieMessage = "The cookie has burnt"
            state.cookie?.state = .burnt
            return
        }
        
        state.cookie = Cookie(state: .baked)
        print("Assa Cookie")
    }
}
