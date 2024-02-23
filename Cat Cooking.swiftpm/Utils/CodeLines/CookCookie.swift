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
            state.cookie!.state = .burnt
            
            state.emit(UpdateCookie(cookie: state.cookie!))
            state.emit(WrongCookie(message: "The cookie has burnt"))
            return
        }
        
        state.cookie = Cookie(state: .baked)
        state.emit(CookCookieEvent())
    }
}
