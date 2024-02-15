//
//  File.swift
//  
//
//  Created by Felipe Passos on 14/02/24.
//

import SpriteKit

class CatNode: SKSpriteNode {
    var cat: Cat
    
    init(cat: Cat) {
        self.cat = cat
        
        let texture = SKTexture(imageNamed: cat.image)
        super.init(texture: texture, color: .gray, size: texture.size())
        
        isUserInteractionEnabled = true
        
        configurate()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurate() {
        if cat.cookie?.hasChocolate ?? false {
            let chocolate = SKSpriteNode(imageNamed: "Cookie")
            chocolate.size = CGSize(width: 50, height: 50)
            chocolate.position.y += 100
            chocolate.run(.repeatForever(.sequence([
                .moveTo(y: chocolate.position.y - 10, duration: 1),
                .moveTo(y: chocolate.position.y + 10, duration: 1),
            ])))
            addChild(chocolate)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        run(.sequence([
            .scaleX(to: 0.9, duration: 0.1),
            .scaleX(to: 1.1, duration: 0.1),
            .scaleX(to: 1.0, duration: 0.1)
        ]))
    }
    
    func walkTo(position: CGPoint) {
        run(.sequence([
            .move(to: position, duration: 3),
            .run {
                self.removeAction(forKey: "Walking")
            }
        ]))
        
        run(.repeatForever(.sequence([
            .scaleX(to: 0.9, duration: 0.1),
            .scaleX(to: 1.1, duration: 0.1),
            .scaleX(to: 1.0, duration: 0.1),
        ])), withKey: "Walking")
    }
}
