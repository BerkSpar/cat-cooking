//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import SpriteKit

class ListNode: SKSpriteNode {
    var list: [CodeLine] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurate()
    }
    
    func configurate() {
        draw()
    }
    
    func draw() {
        for child in children {
            child.removeFromParent()
        }
        
        var lastPosition = position
        
        for line in list {
            let shape = CodeLineNode()
            shape.size = CGSize(width: 300, height: 60)
            shape.color = .green
            shape.position = lastPosition
            
            addChild(shape)
            
            lastPosition.y += -shape.size.height - 10
        }
        
        let shape = SKSpriteNode()
        shape.size = CGSize(width: 300, height: 60)
        shape.color = .gray
        shape.position = lastPosition
        shape.name = "AddNode"
        
        addChild(shape)
        
        GameState.instance.lines = list
    }
    
    
}
