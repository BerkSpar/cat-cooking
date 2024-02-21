//
//  File.swift
//  
//
//  Created by Felipe Passos on 06/02/24.
//

import SpriteKit

class GameScene: SKScene, GameStateListener {
    let state = GameState.instance
    var currentCookie: CookieNode?
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        state.addListener(self)
                                
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
        let catPositions = childNode(withName: "CatPositions")!
        
        Task {
            for (i, current) in state.level.cats.enumerated() {
                let cat = CatNode(cat: current)
                cat.size = CGSize(width: 100, height: 100)
                cat.position = CGPoint(x: -size.width/2 - cat.size.width/2, y: 0)
                addChild(cat)
                
                cat.walkTo(position:  catPositions.children[i].position)
                
                try? await Task.sleep(nanoseconds: 3_000_000_000)
            }
        }
    }
    
    func addCookie() {
        let cookiePreview = childNode(withName: "CookiePreview")!
        
        let cookie = CookieNode(cookie: Cookie(state: .baked, hasChocolate: false))
        cookie.position = cookiePreview.position
        cookie.size = CGSize(width: 50, height: 50)
        addChild(cookie)
        
        currentCookie = cookie
    }
    
    func onStateChange(state: GameState) {
        showText(state.wrongCookieMessage)
        
        if !state.isRunning || state.currentLine < 0 { return }
        
        let currentLine = state.lines[state.currentLine]
        
        if currentLine is DeliverCookie && currentCookie != nil {
            let currentCat = childNode(withName: "CatPositions")!.children[state.currentCat - 1]
            
            var catPosition = currentCat.position
            catPosition.y -= 50
            currentCookie?.run(.sequence([
                .move(to: catPosition, duration: 2),
                .run {
                    self.currentCookie!.eat()
                }
            ]))
        }
        
        if currentLine is CookCookie {
            addCookie()
        }
        
        if currentLine is AddChocolate || currentLine is CookCookie {
            if state.cookie != nil {
                currentCookie?.setCookie(state.cookie!)
            }
        }
    }
    
    func showText(_ text: String?) {
        for child in children {
            if child.name == "UIText" { child.removeFromParent() }
        }
        
        if text == nil { return }
        
        let text = SKLabelNode(text: text)
        text.name = "UIText"
        text.zPosition = 100
        
        var rect = CGRect(
            x: -(text.frame.width + 40) / 2 ,
            y: -(text.frame.height + 20) / 2,
            width: text.frame.width + 40,
            height: text.frame.height + 40
        )
        
        let shape = SKShapeNode(rect: rect)
        shape.fillColor = .black
        shape.zPosition -= 1
        text.addChild(shape)
        
        let cat = SKSpriteNode(imageNamed: "Tommas")
        cat.size = CGSize(width: 150, height: 150)
        cat.position = shape.position
        cat.position.x = shape.frame.width - 75
        cat.position.y += 35
        
        cat.run(.repeatForever(.sequence([
            .rotate(toAngle: 0.1, duration: 0.5),
            .rotate(toAngle: -0.1, duration: 0.5)
        ])))
        
        let background = SKSpriteNode()
        background.size = scene!.size
        background.color = .black
        background.alpha = 0.4
        background.zPosition -= 1
        
        shape.addChild(background)
        
        
        text.addChild(cat)
        
        addChild(text)
    }
    
    func start() {
        Task {
            await self.state.runCode()
        }
    }
    
    func stop() {
        state.stop()
        
        clearCookies()
    }
    
    func clearCookies() {
        for child in children {
            if child is CookieNode { child.removeFromParent() }
        }
    }
}
