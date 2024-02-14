//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class ReturnToStart: CodeLine {
    let name = "Return To Start"
    
    func run(_ state: GameState) {
        state.currentLine = -1
        print("Retorna ao começo")
    }
}
