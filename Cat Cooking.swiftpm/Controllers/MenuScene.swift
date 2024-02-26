//
//  File.swift
//  
//
//  Created by Felipe Passos on 19/02/24.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        setupButtons()
        setupCats()
        setupMusic()
    }
    
    func setupMusic() {
         SoundManager.instance.play("Candy Bazaar")
    }
    
    func addCat(_ isRightToLeft: Bool) {
        let yPositionMin = -300.0
        let yPositionMax = -450.0
        
        let leftPosition = -scene!.frame.width / 2 - 100
        let rightPosition = scene!.frame.width / 2 + 100
        
        let currentStartPosition = isRightToLeft ? rightPosition : leftPosition
        let currentEndPosition = isRightToLeft ? leftPosition : rightPosition
        let currentYPosition = Double.random(in: yPositionMax...yPositionMin)
        let currentCatName = Bool.random() ? "Cat2Full" : "CatFull"
        
        let cat = SKSpriteNode(imageNamed: currentCatName)
        cat.size = CGSize(width: 100, height: 125)
        
        cat.position.y = currentYPosition
        cat.position.x = currentStartPosition
        
        cat.run(.repeatForever(.sequence([
            .scaleX(to: 0.9 * (isRightToLeft ? -1 : 1), duration: 0.1),
            .scaleX(to: 1.1 * (isRightToLeft ? -1 : 1), duration: 0.1),
            .scaleX(to: 1.0 * (isRightToLeft ? -1 : 1), duration: 0.1),
        ])))
        cat.run(.sequence([
            .move(to: CGPoint(x: currentEndPosition, y: -250), duration: 10),
            .run {
                cat.removeFromParent()
            }
        ]))
        
        addChild(cat)
    }
    
    func setupCats() {
        Task {
            while(true) {
                let isRightToLeft = Bool.random()
                addCat(isRightToLeft)
                try? await Task.sleep(nanoseconds: 5_000_000_000)
            }
        }
    }
    
    func setupButton(_ nodeName: String, tapClosure: @escaping () -> Void) {
        let node = childNode(withName: nodeName) as! SKSpriteNode
        
        let button = ButtonNode(imageNamed: nodeName, tapClosure: tapClosure)
        button.position = node.position
        button.size = node.size
        
        addChild(button)
        node.removeFromParent()
    }
    
    func setupButtons() {
        setupButton("StartButton", tapClosure: start)
    }
    
    func start() {
        GameState.instance = GameState()
        
        let newScene = GameScene(fileNamed: "GameScene")!
        
        newScene.size = CGSize(
            width: 1366,
            height: 1024
        )
        
        newScene.scaleMode = .aspectFit
        
        scene?.view?.presentScene(newScene)
    }
}
