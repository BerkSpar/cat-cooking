//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import Foundation

protocol CodeLine {
    var name: String { get }
    
    func run(_ state: GameState)
}
