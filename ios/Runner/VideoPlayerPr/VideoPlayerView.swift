//
//  VideoPlayerView.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 25/9/24.
//

import Foundation
import SwiftUI
import AVKit

enum VideoPlayerAction {
    case play
    case pause
    case stop
}

struct VideoPlayerView: View {
    
    var link: String
    var messenger: FlutterBinaryMessenger
    
    private let methodChannel: FlutterMethodChannel
    
    @ObservedObject var modelVideoPlayer = PlayerViewModel(url: "")
    
    init(link: String,messenger: FlutterBinaryMessenger) {
        self.link = link
        self.messenger = messenger
        self.modelVideoPlayer = PlayerViewModel(url: link)
        self.methodChannel = FlutterMethodChannel(name: "actionVideo", binaryMessenger: messenger)
        self.setupMethodChannel()
        
    }
    
    func setupMethodChannel() {
        
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            switch call.method {
            case "play":
                self.modelVideoPlayer.play()
                result(nil)
            case "pause":
                self.modelVideoPlayer.pause()
                result(nil)
            case "stop":
                result(nil)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        modelVideoPlayer.onStatusChanged = {  isPlaying in
            let status = isPlaying ? "playing" : "paused"
            self.methodChannel.invokeMethod("videoStatusChanged", arguments: status)
        }
    }
    
    
    
    var body: some View {
        VStack {
            VideoPlayer(player: modelVideoPlayer.player)
        }.onAppear{
            if modelVideoPlayer.player.timeControlStatus != .playing {
                modelVideoPlayer.play()
            }
        }
    }
}
