//
//  ImagePicker.swift
//  Runner
//
//  Created by Nguyen Ngoc Tuyen on 27/9/24.
//

import Foundation
import PhotosUI
import UIKit

class ImagePicker: PHPickerViewControllerDelegate {
    var flutterResult: FlutterResult? = nil
    
    init(
        controller: FlutterViewController
    ){
        let imagePickerChannel = FlutterMethodChannel(name:"iamgePickerPlatform",binaryMessenger: controller.binaryMessenger)
        
        imagePickerChannel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "pickImage" {
                self.flutterResult = result
                var config = PHPickerConfiguration(photoLibrary: .shared())
                config.selectionLimit = 10
                config.filter = .images
                let vcController: PHPickerViewController = PHPickerViewController(configuration: config)
                vcController.delegate = self
                controller.present(vcController,animated: true)
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
    
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true,completion: nil)
        let dispatchGroup: DispatchGroup = DispatchGroup()
        var imagesInfo: [[String: Any]] = []
        if results.isEmpty{
            debugPrint("Empty result")
        } else {
            for result in results {
                dispatchGroup.enter()
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { url, error in
                    if let url = url {
                        // Log file URL
                        debugPrint("Image File URL: \(url)")
                        
                        
                        let fileManager = FileManager.default
                        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
                        let newFileURL = documentsDirectory.appendingPathComponent(url.lastPathComponent)
                        debugPrint("File \(newFileURL.path())")
                        // Load image from URL
                        if let image = UIImage(contentsOfFile: url.path) {
                            do {
                                if fileManager.fileExists(atPath: newFileURL.path) {
                                    try fileManager.removeItem(at: newFileURL)
                                }
                                try fileManager.copyItem(at: url, to: newFileURL)
                                // Log image properties
                                let imageInfo: [String: Any] = [
                                    "url": newFileURL.path(),
                                    "width": image.size.width,
                                    "height": image.size.height
                                ]
                                imagesInfo.append(imageInfo)
                            } catch {
                                print("Error copying file: \(error)")
                                self.flutterResult?("Failed to copy image")
                            }
                            
                            //  self.logImageInfo(image: image, url: url)
                        }
                    } else {
                        debugPrint("Failed to load image with error: \(String(describing: error))")
                    }
                    dispatchGroup.leave()
                }
            }
            //            debugPrint("111111 \(results.compactMap(\.assetIdentifier))")
            //            debugPrint("111111 \(results.compactMap(\.assetIdentifier)[0])")
            //            debugPrint("222222 \(results[0].assetIdentifier!)")
            dispatchGroup.notify(queue: .main) {
                self.flutterResult?(imagesInfo)
            }
        }
    }
    
    
    private func logImageInfo(image: UIImage, url: URL) {
        // Log image basic info
        debugPrint("Image Size: \(image.size.width)x\(image.size.height)")
        debugPrint("Image Orientation: \(image.imageOrientation.rawValue)")
        debugPrint("Image type: \(image)")
    }
    
}
