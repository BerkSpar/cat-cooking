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
        state.cookie.state = .baked
        print("Assa Cookie")
    }
}
