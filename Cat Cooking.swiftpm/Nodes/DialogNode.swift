//
//  File.swift
//  
//
//  Created by Felipe Passos on 21/02/24.
//

import SpriteKit

class DialogNode: SKNode {
    private var label: SKLabelNode? = SKLabelNode()
    
    func showText(_ text: String) {
        draw(text)
    }
    
    func hide() {
        label?.removeFromParent()
    }
    
    private func draw(_ text: String) {
        if label != nil {
            hide()
        }
        
        label = SKLabelNode(text: text)
        label!.name = "UIText"
        label!.zPosition = 100
        
        var rect = CGRect(
            x: -(label!.frame.width + 40) / 2 ,
            y: -(label!.frame.height + 20) / 2,
            width: label!.frame.width + 40,
            height: label!.frame.height + 40
        )
        
        let shape = SKShapeNode(rect: rect)
        shape.fillColor = SKColor.black
        shape.zPosition -= 1
        label!.addChild(shape)
        
        let background = SKSpriteNode()
        background.size = scene!.size
        background.color = .black
        background.alpha = 0.4
        background.zPosition -= 1
        shape.addChild(background)
    }
}
