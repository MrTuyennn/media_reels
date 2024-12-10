import Flutter
import UIKit
import PhotosUI
import WidgetKit

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
        
        /***Module widget***/
        let storageChannel = FlutterMethodChannel(
                name: "com.example.simpleIosWidgetExample/storage",
                binaryMessenger: controller.binaryMessenger
        )
        storageChannel.setMethodCallHandler(
                {
                    (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                    guard call.method == "savePreferences" else {
                        result(
                            FlutterMethodNotImplemented
                        )
                        return
                    }
                    
                    guard let args = call.arguments as? [String: Any] else {
                        result(
                            FlutterError(
                                code: "UNAVAILABLE",
                                message: "It's required send arguments",
                                details: nil
                            )
                        )
                        return
                    }
                    
                    guard let key = args["key"] as? String else {
                        result(
                            FlutterError(
                                code: "UNAVAILABLE",
                                message: "Its required send a key",
                                details: nil
                            )
                        )
                        return
                    };
                    
                    StorageHelper.setValue(key: key, value: args["value"] as Any)
                    
                    WidgetCenter.shared.reloadTimelines(ofKind: "CounterWidget")
                    
                    result(StorageHelper.getString(key: key))
                })
        /***Module widget***/
        
        
        
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
