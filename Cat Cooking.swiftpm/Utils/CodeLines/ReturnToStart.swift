//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class ReturnToStart: CodeLine {
    let name = "ReturnToStart"
    
    func run(_ state: GameState) {
        state.returnToStart = true
    }
}
