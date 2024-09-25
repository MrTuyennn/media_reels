//
//  VideoPlayerModel.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 25/9/24.
//

import Foundation
import AVKit

@available(iOS 14.0, *)
public class PlayerViewModel: ObservableObject {
    
    @Published var player = AVPlayer()
    
    public init(url: String) {
        if let videoUrl = URL(string: url) {
            self.player = AVPlayer(url: videoUrl)
        }
    }
}


