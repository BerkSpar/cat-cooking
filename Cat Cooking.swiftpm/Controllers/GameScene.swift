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
        
        state.onStateChange = onStateChange
                        
        setupButtons()
    }
    
    func setupButtons() {
        let startButton = childNode(withName: "StartButton") as! ButtonNode
        startButton.tapClosure = start
        
        let pauseButton = childNode(withName: "PauseButton") as! ButtonNode
        pauseButton.tapClosure = pause
    }
    
    func onStateChange() {
        let codeList = childNode(withName: "CodeList")!
        
        for child in codeList.children {
            (child as! SKSpriteNode).color = .red
        }
        
        (codeList.children[state.currentLine] as! SKSpriteNode).color = .black
    }
    
    func start() {
        Task {
            await self.state.runCode()
        }
    }
    
    func pause() {
        state.reset()
    }
}
