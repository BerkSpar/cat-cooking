//
//  File.swift
//  
//
//  Created by Felipe Passos on 11/02/24.
//

import SpriteKit

class CodeLineNode: SKSpriteNode {
    var line: CodeLine?
    
    init(imageNamed: String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
