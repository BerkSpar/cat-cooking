//
//  File.swift
//  
//
//  Created by Felipe Passos on 06/02/24.
//

import SpriteKit

class GameScene: SKScene {
    let state = GameState.instance
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
                                
        setupButtons()
        setupBlocks()
        setupCats()
    }
    
    func setupBlocks() {
        let cookieCookie = childNode(withName: "CookCookieBlock") as! CodeBlockNode
        cookieCookie.line = CookCookie()
        
        let deliverCookie = childNode(withName: "DeliverCookieBlock") as! CodeBlockNode
        deliverCookie.line = DeliverCookie()
        
        let returnToStart = childNode(withName: "ReturnToStartBlock") as! CodeBlockNode
        returnToStart.line = ReturnToStart()
        
        let addChocolate = childNode(withName: "AddChocolateBlock") as! CodeBlockNode
        addChocolate.line = AddChocolate()
        
        let ifCondition = childNode(withName: "IfConditionBlock") as! CodeBlockNode
        ifCondition.line = IfCondition()
    }
    
    func setupButtons() {
        let startButton = childNode(withName: "StartButton") as! ButtonNode
        startButton.tapClosure = start
        
        let pauseButton = childNode(withName: "PauseButton") as! ButtonNode
        pauseButton.tapClosure = stop
    }
    
    func setupCats() {
        for cat in state.level.cats {
            let cat = CatNode(cat: Cat(cookie: Cookie(state: .baked, hasChocolate: true), image: "Cat"))
            cat.size = CGSize(width: 100, height: 100)
            cat.position = CGPoint(x: -size.width/2 - cat.size.width/2, y: 0)
            addChild(cat)
            
            cat.walkTo(position:  CGPoint(x: 0, y: 0))
        }
    }
    
    func start() {
        Task {
            await self.state.runCode()
        }
    }
    
    func stop() {
        state.stop()
    }
}
