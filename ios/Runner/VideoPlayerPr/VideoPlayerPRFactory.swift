//
//  VideoPlayerPRFactory.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 18/9/24.
//

import Foundation
import Flutter
import UIKit

class VideoPlayerPRFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

        init(messenger: FlutterBinaryMessenger) {
            self.messenger = messenger
            super.init()
        }

        func create(
            withFrame frame: CGRect,
            viewIdentifier viewId: Int64,
            arguments args: Any?
        ) -> FlutterPlatformView {
            return VideoPlayerPRView(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                binaryMessenger: messenger)
        }

        /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
        public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
              return FlutterStandardMessageCodec.sharedInstance()
        }
}
