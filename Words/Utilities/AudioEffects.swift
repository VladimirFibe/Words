//
//  AudioEffects.swift
//  Words
//
//  Created by Андрей Важенов on 29.03.2022.
//

import Foundation
import AVFoundation

class AudioEffects {
    var player: AVAudioPlayer?
    
    func playSound(_ title: String) {
            guard let url = Bundle.main.url(forResource: title, withExtension: "mp3") else { return }
            do {
            player = try AVAudioPlayer(contentsOf: url)
            } catch let error {
                print(error.localizedDescription)
            }
            player?.play()
        }
    
    
}

