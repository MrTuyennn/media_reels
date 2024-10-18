//
//  Sound.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 18/10/24.
//

import AVFoundation

class Sound {
    private var audioPlayer: AVAudioPlayer?
    
    init () {
        guard let path = Bundle.main.path(forResource: "sample_audio", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            }
            audioPlayer?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
