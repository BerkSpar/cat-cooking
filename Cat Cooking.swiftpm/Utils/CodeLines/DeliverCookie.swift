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
        state.currentCat += 1
        print("Entrega")
    }
}
