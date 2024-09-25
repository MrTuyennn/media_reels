//
//  VideoPlayerView.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 25/9/24.
//

import Foundation
import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @ObservedObject var modelVideoPlayer = PlayerViewModel(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
    
    var link: String
    var duration: String
    
    var body: some View {
        VStack {
            VideoPlayer(player: modelVideoPlayer.player)
        }
    }
}
