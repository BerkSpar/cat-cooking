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
        draw()
        
        state.addListener(self)
    }
    
    func onStateChange(state: GameState) {
        draw()
    }
    
    func draw() {
        for child in children {
            child.removeFromParent()
        }
        
        var lastPosition = CGPoint(x: 0, y: 0)
        
        for (index, line) in state.lines.enumerated() {
            let shape = CodeLineNode()
            shape.size = CGSize(width: 300, height: 60)
            shape.color = .green
            shape.position = lastPosition
            
            if !state.isRunning {
                let removeButton = ButtonNode(imageNamed: "Button") {
                    self.state.removeLine(at: index)
                }
                removeButton.size = CGSize(width: 60, height: 60)
                removeButton.position = CGPoint(x: shape.size.width / 2 + 20, y: 0)
                shape.addChild(removeButton)
            }
            
            let text = SKLabelNode(text: line.name)
            text.fontColor = .black
            shape.addChild(text)
            
            if index == state.currentLine && state.isRunning {
                shape.color = .magenta
            }
            
            addChild(shape)
            
            lastPosition.y += -shape.size.height - 10
        }
        
        if !state.isRunning && state.lines.count < 12 {
            let shape = SKSpriteNode()
            shape.size = CGSize(width: 300, height: 60)
            shape.color = .gray
            shape.position = lastPosition
            shape.name = "AddNode"
            
            addChild(shape)
        }
    }
}
