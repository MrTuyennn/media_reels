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
    
    private var timeControlStatusObserver: NSKeyValueObservation?
    
    var onStatusChanged: ((Bool) -> Void)?
    
    public init(url: String) {
        if let videoUrl = URL(string: url) {
            self.player = AVPlayer(url: videoUrl)
        }
        
        timeControlStatusObserver = player.observe(\.timeControlStatus, options: [.new, .old]) { [weak self] player, _ in
            guard let self = self else { return }
            
            // Notify about play/pause state
            if player.timeControlStatus == .playing {
                self.onStatusChanged?(true)  // Playing
            } else {
                self.onStatusChanged?(false) // Paused
            }
        }
    }
    
    func play () {
        player.play()
    }
    
    func pause () {
        player.pause()
    }
    
    func getPosition(){
        player.currentItem?.duration
    }
    
    func timeControlStatus () -> Bool {
        return player.timeControlStatus == .playing
    }
    
    
}


