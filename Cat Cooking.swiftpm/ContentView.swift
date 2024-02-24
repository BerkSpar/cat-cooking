import SwiftUI
import SpriteKit

struct ContentView: View {
    @StateObject var router = RouterManager.shared
    
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
            ZStack {
                SpriteView(scene: self.scene)
                    .ignoresSafeArea()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height,
                        alignment: .center
                    )
                
                if router.isPopUpPresented {
                    router.popUp
                }
            }
        }
        .preferredColorScheme(.light)
    }
}
