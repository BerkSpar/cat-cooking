//
//  File.swift
//  
//
//  Created by Felipe Passos on 11/02/24.
//

import SpriteKit

class CodeLineNode: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurate()
    }
    
    func configurate() {
        color = .cyan
        
        configurePhysics()
    }
    
    func configurePhysics() {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.categoryBitMask = PhysicsCategory.codeLine
        physicsBody?.contactTestBitMask = PhysicsCategory.codeBlock
        physicsBody?.collisionBitMask = PhysicsCategory.codeBlock
        physicsBody?.usesPreciseCollisionDetection = false
        physicsBody?.affectedByGravity = false
        physicsBody?.allowsRotation = false
    }
}
