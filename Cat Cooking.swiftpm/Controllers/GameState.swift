//
//  File.swift
//  
//
//  Created by Felipe Passos on 13/02/24.
//

import SpriteKit

protocol GameStateListener {
  func onStateChange(event: GameEvent)
}

class GameState: SKNode {
    var listeners: [GameStateListener] = []
    
    static var instance = GameState()
    
    var levels: [GameLevel] = [
        Level2(),
        Level3(),
        Level4()
    ]
    
    var lines: [CodeLine] = [] {
        didSet {
            emit(LinesChaged())
        }
    }
    
    var currentLine: Int = 0
    var currentCat: Int = 0
    var cookie: Cookie?
    var cookies: [Cookie] = []
    var iterationCount = 0
    var level: GameLevel = Level1()
    var returnToStart: Bool = false
    var hasError: Bool = false
    
    var isRunning: Bool = false

    func runCode() async {
        if isRunning { return }
        
        reset()
        
        isRunning = true
        
        while(currentLine < lines.count &&
              isRunning &&
              currentCat < level.cats.count &&
              !hasError) {
            iterationCount += 1
            
            let line = lines[currentLine]
            line.run(self)
            
            emit(RunLine())
            
            currentLine += 1
            
            try? await Task.sleep(nanoseconds: 1_000_000_000)
            
            if returnToStart {
                currentLine = 0
                returnToStart = false
            }
        }
        
        validateLevel()
    }
    
    func validateLevel() {
        if hasError {
            return
        }
        
        if level.cats.count != cookies.count {
            emit(WrongCookie(message: "There's a kitten without a cookie"))
            return
        }
        
        var cookieIndex = 0
        for cat in level.cats {
            if (cat.cookie != cookies[cookieIndex]) {
                emit(WrongCookie(message: "There's a kitten with the wrong cookie"))
                return
            }
            
            cookieIndex += 1
        }
        
        emit(GoToNextLevel())
    }
    
    func reset() {
        currentLine = 0
        currentCat = 0
        cookie = nil
        cookies = []
        iterationCount = 0
        hasError = false
        
        emit(ResetEvent())
    }
    
    func setLevel(_ level: GameLevel) {
        lines = []
        currentLine = 0
        currentCat = 0
        cookie = nil
        cookies = []
        iterationCount = 0
        self.level = level
        isRunning = false
        hasError = false
    }
    
    func stop() {
        isRunning = false
        reset()
        
        emit(StopGame())
    }
    
    func addListener(_ listener: GameStateListener) {
        listeners.append(listener)
    }
    
    func emit(_ event: GameEvent) {
        if event is WrongCookie { hasError = true }
        
        for listener in listeners {
            listener.onStateChange(event: event)
        }
    }
}
