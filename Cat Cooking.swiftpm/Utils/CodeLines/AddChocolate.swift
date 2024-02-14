//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

class AddChocolate: CodeLine {
    let name = "Add Chocolate"
    
    func run(_ state: GameState) {
        state.cookie.hasChocolate = true
        print("Adiciona chocolate")
    }
}
