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
            } else if call.method == "captureView" {
                if let args = call.arguments as? [String: Any],
                       let imageBytes = args["imageBytes"] as? FlutterStandardTypedData {
                    self.handleCaptureView(call, result: result)
                        result("Image received and processed in native code")
                    } else {
                        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid arguments for captureView", details: nil))
                    }
//                guard let args = call.arguments as? [String: Any],
//                                     let imageBytes = args["imageBytes"] as? FlutterStandardTypedData else {
//                                   result(FlutterError(code: "INVALID_ARGUMENTS", message: "Invalid arguments", details: nil))
//                                   return
//                               }
//                               
//                               // Convert image bytes to UIImage
//                               let data = imageBytes.data
//                               if let image = UIImage(data: data) {
//                                   // Save to Photos
//                                   UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//                                   result("Image saved successfully")
//                               } else {
//                                   result(FlutterError(code: "IMAGE_CONVERSION_FAILED", message: "Failed to convert image data", details: nil))
//                               }
            } else {
                result(FlutterMethodNotImplemented)
                return
            }
        })
    }
    
    private func handleCaptureView(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
          // Parse arguments safely
          guard let args = call.arguments as? [String: Any],
                let imageBytes = args["imageBytes"] as? FlutterStandardTypedData else {
            throw NSError(domain: "ImageCaptureError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid arguments for captureView"])
          }

          print("Received imageBytes: \(imageBytes.data.count) bytes")
          
          // Proceed with your logic here (e.g., saving the image)
          self.handleImageCapture(imageBytes.data)

          result("Image received and processed")
          
        } catch let error as NSError {
          // Handle any errors and log them
          print("Error processing captureView: \(error.localizedDescription)")
          result(FlutterError(code: "CAPTURE_VIEW_ERROR", message: "Failed to capture view", details: error.localizedDescription))
        }
      }
    
    private func handleImageCapture(_ imageData: Data) {
           guard let view = createViewFromImageData(imageData) else {
               flutterResult?(FlutterError(code: "VIEW_ERROR", message: "Failed to create view from data", details: nil))
               return
           }

           guard let capturedImage = captureUIView(view) else {
               flutterResult?(FlutterError(code: "CAPTURE_ERROR", message: "Failed to capture view", details: nil))
               return
           }

           // Save the captured image
           UIImageWriteToSavedPhotosAlbum(capturedImage, nil, nil, nil)
           flutterResult?("Image captured and saved successfully")
       }

       // Generate a UIView from Flutter-sent data
       private func createViewFromImageData(_ imageData: Data) -> UIView? {
           guard let image = UIImage(data: imageData) else { return nil }
           let imageView = UIImageView(image: image)
           imageView.contentMode = .scaleAspectFit
           imageView.frame = CGRect(origin: .zero, size: image.size) // Use image size to define view size
           return imageView
       }

       // Capture UIView as UIImage
       private func captureUIView(_ view: UIView) -> UIImage? {
           let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
           return renderer.image { context in
               view.layer.render(in: context.cgContext)
           }
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
