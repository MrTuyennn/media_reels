//
//  Sound.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 18/10/24.
//

import AVFoundation

class Sound {
    private var audioPlayer: AVAudioPlayer?
    var messenger: FlutterBinaryMessenger
    private var methodChannel: FlutterMethodChannel
    
    init (messenger: FlutterBinaryMessenger) {
        
        self.messenger = messenger
        self.methodChannel = FlutterMethodChannel(name: "actionVideo", binaryMessenger: messenger)

        guard let path = Bundle.main.path(forResource: "sample_audio", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            if audioPlayer == nil {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        self.setupMethodChannel()
    }
    
    private func play() {
        audioPlayer?.play()
    }
    
    private func stop() {
        audioPlayer?.stop()
    }
    
    private func pause() {
        audioPlayer?.pause()
    }
    
    private func release() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
        audioPlayer?.prepareToPlay()
    }
    
    private func setupMethodChannel() {
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            switch call.method {
            case "playSong":
                self.play()
                result(nil)
            case "pauseSong":
                self.pause()
                result(nil)
            case "stopSong":
                self.stop()
                result(nil)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
