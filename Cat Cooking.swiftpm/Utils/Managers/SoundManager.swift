//
//  File.swift
//  
//
//  Created by Felipe Passos on 21/02/24.
//

import Foundation
import AVFAudio

@MainActor
class SoundManager {
    static let instance = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    private var playbackAudioCount = 5
    
    private var lastPath: String?
    
    func play(_ path: String) {
        if path == lastPath {
            return
        }
        
        lastPath = path
        
        guard let file = Bundle.main.path(forResource: path, ofType: "mp3") else {
            print("Error: Could not find sound file at path: \(path)")
            return
        }
        
        let sound = URL(fileURLWithPath: file)

        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true)

        try! audioPlayer = AVAudioPlayer(contentsOf: sound)
        audioPlayer?.prepareToPlay()
        audioPlayer?.numberOfLoops = -1
                
        audioPlayer?.play()
    }
}
