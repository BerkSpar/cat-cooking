//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class AddChocolate: CodeLine {
    let name = "AddChocolate"
    
    func run(_ state: GameState) {
        if state.cookie == nil {
            state.emit(WrongCookie(message: "There's no cookie to add chocolate"))
            return
        }
        
        if state.cookie!.hasChocolate {
            state.emit(WrongCookie(message: "There's lots of chocolate"))
            return
        }
        
        state.cookie!.hasChocolate = true
        state.emit(UpdateCookie(cookie: state.cookie!))
    }
}
