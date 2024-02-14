//
//  File.swift
//  
//
//  Created by Felipe Passos on 06/02/24.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    let state = GameState()
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        state.onStateChange = onStateChange
                        
        setupButtons()
    }

    
    func setupButtons() {
        let startButton = childNode(withName: "StartButton") as! ButtonNode
        startButton.tapClosure = start
        
        

        
//        let codeList = childNode(withName: "CodeList")!
//        
//        for child in codeList.children {
//            let button = ButtonNode(imageNamed: "Button", tapClosure: {
//                print("Button Clicked")
//            })
//            button.position = child.position
//            button.size = (child as! SKSpriteNode).size
//            
//            codeList.addChild(button)
//            child.removeFromParent()
//        }
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
    
    func stop() {
        state.reset()
    }
}
