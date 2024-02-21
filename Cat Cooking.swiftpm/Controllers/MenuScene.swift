//
//  File.swift
//  
//
//  Created by Felipe Passos on 19/02/24.
//

import SpriteKit

class MenuScene: SKScene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        
        setupButtons()
    }
    
    func setupButtons() {
        let startButton = childNode(withName: "StartButton") as! ButtonNode
        startButton.tapClosure = start
    }
    
    func start() {
        let newScene = GameScene(fileNamed: "GameScene")!
        
        newScene.size = CGSize(
            width: 1366,
            height: 1024
        )
        
        newScene.scaleMode = .aspectFit
        
        scene?.view?.presentScene(newScene)
    }
}
