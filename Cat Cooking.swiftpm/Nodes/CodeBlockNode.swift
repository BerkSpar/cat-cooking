//
//  File.swift
//  
//
//  Created by Felipe Passos on 06/02/24.
//

import Foundation
import SpriteKit

class CodeBlockNode: SKSpriteNode {
    var shadow: SKShapeNode?
    var initialPosition: CGPoint?
    
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
        configurePhysics()
        
        initialPosition = position
    }
    
    func configurePhysics() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.categoryBitMask = PhysicsCategory.codeBlock
        physicsBody?.contactTestBitMask = PhysicsCategory.codeLine
        physicsBody?.collisionBitMask = PhysicsCategory.codeLine
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
    }
    
    func configureShadow() {
        shadow = SKShapeNode(rectOf: size)
        
        shadow!.fillColor = .black
        shadow!.position = CGPoint(x: -5, y: -5)
        shadow!.alpha = 0.25
        // shadow!.zPosition = -1
        
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
        returnToDeck()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            position = touch.location(in: self.parent!)
        }
    }
}
