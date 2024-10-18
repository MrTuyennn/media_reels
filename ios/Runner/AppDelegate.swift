import Flutter
import UIKit
import PhotosUI

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    var sound: Sound?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        /***Module chanel***/
        _ =  ImagePicker(controller: controller)
        /*** Initialize Sound class ***/
        sound = Sound(messenger: controller.binaryMessenger)
        
        /***Module chanel***/
        
        /*** view manager module*/
        
        // ----- video player ----- //
        weak var registrarVideoPlayer = self.registrar(forPlugin: "plugin-videoplayer")
        let factoryVideoPlayer = VideoPlayerPRFactory(messenger: registrarVideoPlayer!.messenger())
        self.registrar(forPlugin: "_videoplayer")!.register(factoryVideoPlayer, withId: "vlc")
        // ----- video player ----- //
        /*** view manager module*/
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
}
