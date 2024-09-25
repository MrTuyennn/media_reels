//
//  VideoPlayerPRView.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 18/9/24.
//

import Foundation
import Flutter
import UIKit
import SwiftUI

class VideoPlayerPRView: NSObject, FlutterPlatformView {
    private var _viewController: UIViewController
    
    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        // Parse arguments from Flutter
        let argsDict = args as? [String: Any]
        let link = argsDict?["link"] as? String ?? "No link"
        let duration = argsDict?["duration"] as? String ?? "No duration"
        
        // Create SwiftUI View
        let videoPlayerView = VideoPlayerView(link: link, duration: duration)
        
        // Embed SwiftUI View into a UIViewController
        _viewController = UIHostingController(rootView: videoPlayerView)
        
        super.init()
    }
    
    func view() -> UIView {
        return _viewController.view
    }
    
    
}
