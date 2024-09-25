import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        weak var registrarVideoPlayer = self.registrar(forPlugin: "plugin-videoplayer")
        
        let factoryVideoPlayer = VideoPlayerPRFactory(messenger: registrarVideoPlayer!.messenger())
        
        self.registrar(forPlugin: "_videoplayer")!.register(factoryVideoPlayer, withId: "videoplayer")
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
