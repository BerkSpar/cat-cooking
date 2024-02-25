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
    
    init(imageNamed: String, line: CodeLine) {
        self.line = line
        
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurate() {
        configureShadow()
        
        initialPosition = position
        zPosition = 1
    }
    
    func configureShadow() {
        shadow = SKShapeNode(rectOf: size)
        
        shadow!.path = UIBezierPath(
            roundedRect: CGRect(
                x: -frame.width / 2,
                y: -frame.height / 2,
                width: frame.width,
                height: frame.height
            ),
            byRoundingCorners: [.allCorners],
            cornerRadii: CGSize(width: 16, height: 16)
        ).cgPath
        
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
                    state.lines.append(line!)
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
