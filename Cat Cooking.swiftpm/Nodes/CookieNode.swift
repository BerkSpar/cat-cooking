//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import SpriteKit

class CookieNode: SKSpriteNode {
    var cookie: Cookie
    
    init(cookie: Cookie) {
        self.cookie = cookie
        
        let texture = SKTexture(imageNamed: cookie.image)
        super.init(texture: texture, color: .gray, size: texture.size())
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func eat() {
        run(.repeat(.sequence([
            .scaleY(to: 0.9, duration: 0.2),
            .scaleY(to: 1.1, duration: 0.2),
            .scaleY(to: 1.0, duration: 0.2)
        ]), count: 3))
    }
}
