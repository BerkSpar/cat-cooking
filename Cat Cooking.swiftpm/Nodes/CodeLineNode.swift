//
//  File.swift
//  
//
//  Created by Felipe Passos on 11/02/24.
//

import SpriteKit

class CodeLineNode: SKSpriteNode {
    var line: CodeLine? 
    
    init() {
        super.init(texture: .none, color: .gray, size: CGSize(width: 300, height: 40))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configurate()
    }
    
    func configurate() {
        color = .gray
    }
}
