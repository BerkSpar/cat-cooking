//
//  File.swift
//  
//
//  Created by Felipe Passos on 13/02/24.
//

import SpriteKit

protocol GameStateListener {
  func onStateChange(state: GameState)
}

class GameState: SKNode {
    var listeners: [GameStateListener] = []
    
    static var instance = GameState()
    
    var lines: [CodeLine] = []
    var currentLine: Int = 0
    var currentCat: Int = 0
    var cookie: Cookie?
    var iterationCount = 0
    var level: GameLevel = Level2()
    var returnToStart: Bool = false
    var wrongCookieMessage: String? {
        didSet {
            print(wrongCookieMessage)
        }
    }
    
    var isRunning: Bool = false
    
    func addLine(_ line: CodeLine) {
        lines.append(line)
        notifyListeners()
    }
    
    func removeLine(at position: Int) {
        lines.remove(at: position)
        notifyListeners()
    }

    func runCode() async {
        if isRunning { return }
        
        reset()
        
        isRunning = true
        
        while(currentLine < lines.count &&
              isRunning &&
              currentCat < level.cats.count &&
              wrongCookieMessage == nil) {
            iterationCount += 1
            
            let line = lines[currentLine]
            line.run(self)

            notifyListeners()
            
            if returnToStart {
                returnToStart = false
                currentLine = -1
            }
            
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            currentLine += 1
        }
    }
    
    func reset() {
        currentLine = 0
        currentCat = 0
        cookie = nil
        wrongCookieMessage = nil
        
        notifyListeners()
    }
    
    func stop() {
        isRunning = false
        reset()
    }
    
    func addListener(_ listener: GameStateListener) {
        listeners.append(listener)
    }
    
    func notifyListeners() {
        for listener in listeners {
            listener.onStateChange(state: self)
        }
    }
}
