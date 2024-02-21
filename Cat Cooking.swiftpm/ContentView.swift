import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = MenuScene(fileNamed: "MenuScene")!
                
        scene.size = CGSize(
            width: 1366,
            height: 1024
        )
        
        scene.scaleMode = .aspectFit
        
        return scene
    }

    var body: some View {
        GeometryReader { (geometry) in
        
        SpriteView(scene: self.scene)
            .ignoresSafeArea()
            .frame(
                width: geometry.size.width,
                height: geometry.size.height,
                alignment: .center
            )
        }
    }
}
