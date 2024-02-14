//
//  File.swift
//  
//
//  Created by Felipe Passos on 06/02/24.
//

import SpriteKit

class CodeBlockNode: SKSpriteNode {
    private var shadow: SKShapeNode?
    private var initialPosition: CGPoint?
    
    var line: CodeLine?
    
    private var state = GameState.instance
    
    override var isUserInteractionEnabled: Bool {
        set {}
        get { return true }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurate()
    }
    
    func configurate() {
        configureShadow()
        
        initialPosition = position
        zPosition = 1
    }
    
    func configureShadow() {
        shadow = SKShapeNode(rectOf: size)
        
        shadow!.fillColor = .black
        shadow!.position = CGPoint(x: -5, y: -5)
        shadow!.alpha = 0.25
        shadow!.zPosition = -1
        
        shadow!.run(.hide())
        
        addChild(shadow!)
    }
    
    func returnToDeck() {
        run(.sequence([
            .move(to: initialPosition!, duration: 0.3),
            .run {
                self.shadow!.run(.hide())
            }
        ]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        shadow!.run(.unhide())
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self.parent!)
            
            let touchedNodes = parent!.nodes(at: location)
            for node in touchedNodes {
                if node.name == "AddNode" && line != nil {
                    state.addLine(line!)
                }
            }
        }
        
        returnToDeck()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: self.parent!)
        }
    }
}
