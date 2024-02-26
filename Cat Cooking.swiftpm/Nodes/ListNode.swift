//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import SpriteKit

class ListNode: SKNode, GameStateListener {
    var state = GameState.instance
    
    func configurate() {
        state.addListener(self)
        draw()
    }
    
    func onStateChange(event: GameEvent) {
        if event is LinesChaged ||
           event is RunLine ||
           event is StopGame {
            draw()
        }
    }
    
    func draw() {
        for child in children {
            child.removeFromParent()
        }
        
        var lastPosition = CGPoint(x: 0, y: 0)
        
        for (index, line) in state.lines.enumerated() {
            var name = "\(line.name)Line"
            
            if index == state.currentLine && state.isRunning {
                name += "Running"
            }
            
            let shape = CodeLineNode(imageNamed: name)
            shape.position = lastPosition
            
            if !state.isRunning {
                let removeButton = ButtonNode(imageNamed: "RemoveButton") {
                    self.state.lines.remove(at: index)
                }
                removeButton.position = CGPoint(x: shape.size.width / 2 - 25, y: 0)
                shape.addChild(removeButton)
            }
            
            addChild(shape)
            
            lastPosition.y += -shape.size.height - 10
        }
        
        if !state.isRunning && state.lines.count < 8 {
            let shape = SKSpriteNode(imageNamed: "EmptyLine")
            shape.color = .gray
            shape.position = lastPosition
            shape.name = "AddNode"
            
            addChild(shape)
        }
    }
}
