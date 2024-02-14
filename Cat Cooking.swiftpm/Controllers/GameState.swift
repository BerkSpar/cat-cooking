//
//  File.swift
//  
//
//  Created by Felipe Passos on 13/02/24.
//

import SpriteKit

enum CookieState {
    case cru
    case assado
    case queimado
}

struct Cookie {
    var state: CookieState = .cru
    var hasChocolate: Bool = false
}

struct Cat {
    var cookie: Cookie?
}

protocol CodeLine {
    func run(_ state: GameState)
}

class AddChocolate: CodeLine {
    func run(_ state: GameState) {
        state.cookie.hasChocolate = true
        print("Adiciona chocolate")
    }
}

class DeliverCookie: CodeLine {
    func run(_ state: GameState) {
        print("Entrega")
    }
}

class CookCookie: CodeLine {
    func run(_ state: GameState) {
        state.cookie.state = .assado
        print("Assa Cookie")
    }
}

class ReturnToStart: CodeLine {
    func run(_ state: GameState) {
        state.currentLine = -1
        print("Retorna ao começo")
    }
}

protocol GameLevel {
    var cats: [Cat] { get }
}

class Level1: GameLevel {
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .assado)),
        Cat(cookie: Cookie(state: .assado)),
        Cat(cookie: Cookie(state: .assado)),
    ]
}

class Level2: GameLevel {
    let cats: [Cat] = [
        Cat(cookie: Cookie(state: .assado, hasChocolate: true)),
    ]
}

class GameState: SKNode {
    var lines: [CodeLine] = [
        AddChocolate(),
        CookCookie(),
        DeliverCookie(),
        ReturnToStart()
    ]
    
    var currentLine: Int = 0
    var cookie: Cookie = Cookie()
    var iterationCount = 0
    
    var level: GameLevel = Level1()
    
    var onStateChange: (() -> Void)?
        
    func runCode() async {
        reset()
        
        while(currentLine < lines.count) {
            onStateChange?()
            
            iterationCount += 1
            
            let line = lines[currentLine]
            line.run(self)
            
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            currentLine += 1
        }
    }
    
    func reset() {
        currentLine = 0
        cookie = Cookie()
    }
}
