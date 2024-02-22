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
        setupMusic()
        setupTommas()
        setupList()
    }
    
    func setupList() {
        let node = childNode(withName: "CodeList")!
        
        let list = ListNode()
        list.position = node.position
        list.configurate()
        
        addChild(list)
        node.removeFromParent()
    }
    
    func setupTommas() {
        let tommas = childNode(withName: "Tommas")!
        tommas.run(.repeatForever(.sequence([
            .rotate(toAngle: 0.1, duration: 1),
            .rotate(toAngle: -0.1, duration: 1)
        ])))
    }
    
    func setupMusic() {
        SoundManager.instance.play("Jazzberry Jam")
    }
    
    func setupBlock(_ nodeName: String, line: CodeLine, isHidden: Bool = false) {
        let node = childNode(withName: nodeName) as! SKSpriteNode
        
        let block = CodeBlockNode(imageNamed: "Button", line: line)
        block.position = node.position
        block.size = node.size
        block.configurate()
        block.isHidden = isHidden
        
        addChild(block)
        node.removeFromParent()
    }
    
    func setupBlocks() {
        setupBlock("CookCookieBlock", line: CookCookie())
        setupBlock("DeliverCookieBlock", line: DeliverCookie())
        setupBlock("ReturnToStartBlock", line: ReturnToStart(), isHidden: !state.level.enableReturnToStart)
        setupBlock("AddChocolateBlock", line: AddChocolate(), isHidden: !state.level.enableChocolate)
        setupBlock("IfConditionBlock", line: IfCondition(), isHidden: !state.level.enableIfCondition)
    }
    
    func setupButton(_ nodeName: String, tapClosure: @escaping () -> Void) {
        let node = childNode(withName: nodeName) as! SKSpriteNode
        
        let button = ButtonNode(imageNamed: "Button", tapClosure: tapClosure)
        button.position = node.position
        button.size = node.size
        
        addChild(button)
        node.removeFromParent()
    }
    
    func setupButtons() {
        setupButton("StartButton", tapClosure: start)
        setupButton("PauseButton", tapClosure: stop)
    }
    
    func setupCats() {
        let yPositionMin = -300.0
        let yPositionMax = -450.0
        
        let catPositions = childNode(withName: "CatPositions")!
        
        Task {
            for (i, current) in state.level.cats.enumerated() {
                let cat = CatNode(cat: current)
                cat.size = CGSize(width: 100, height: 125)
                cat.position = CGPoint(
                    x: -size.width/2 - cat.size.width/2,
                    y: Double.random(in: yPositionMax...yPositionMin)
                )
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
        cookie.size = CGSize(width: 100, height: 100)
        addChild(cookie)
        
        currentCookie = cookie
    }
    
    func onStateChange(state: GameState) {
        let tommas = childNode(withName: "Tommas")!
        
        if state.canGoToNextLevel {
            tommas.isHidden = true
            RouterManager.shared.showPopUp(Popup(text: "Acabou") {
                tommas.isHidden = false
            })
            return
        }
        
        if state.wrongCookieMessage != nil {
            tommas.isHidden = true
            RouterManager.shared.showPopUp(Popup(text: state.wrongCookieMessage!, isHappy: false) {
                self.stop()
                tommas.isHidden = false
            })
        }
        
        if !state.isRunning || state.currentLine < 0 || state.currentLine > state.lines.count - 1 { return }
        
        let currentLine = state.lines[state.currentLine]
        
        if currentLine is DeliverCookie && currentCookie != nil && state.currentCat > 0 {
            let currentCat = childNode(withName: "CatPositions")!.children[state.currentCat - 1]
            
            var catPosition = currentCat.position
            catPosition.y -= 25
            catPosition.x += 20
            currentCookie?.run(.sequence([
                .group([
                    .move(to: catPosition, duration: 2),
                    .resize(toWidth: 30, height: 30, duration: 2)
                ]),
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
