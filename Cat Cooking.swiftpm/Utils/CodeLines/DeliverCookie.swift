//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class DeliverCookie: CodeLine {
    let name = "Deliver Cookie"
    
    func run(_ state: GameState) {
        if state.cookie == nil {
            state.emit(WrongCookie(message: "There is no cookie to deliver"))
            return
        }
        
        let catCookie = state.level.cats[state.currentCat].cookie
        if catCookie != state.cookie {
            state.emit(WrongCookie(message: "The cat don't want this cookie"))
        }
        
        state.currentCat += 1
        state.cookies.append(state.cookie!)
        state.cookie = nil
        
        state.emit(DeliverCookieEvent())
    }
}
