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
            state.emit(WrongCookie(message: "There is no cookie to add chocolate"))
            return
        }
        
        if state.cookie!.hasChocolate {
            state.emit(WrongCookie(message: "Tem chocolate demais no cookie"))
            return
        }
        
        state.cookie!.hasChocolate = true
        state.emit(UpdateCookie(cookie: state.cookie!))
    }
}
