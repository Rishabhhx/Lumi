//
//  InstagramHandler.swift
//  Lumi
//
//  Created by Rishabh Sharma on 08/08/22.
//

import UIKit
import Foundation
import AVFoundation
import Photos
/*
 PHCachingImageManager().requestAVAssetForVideo(asset, options: nil, resultHandler: {(asset: AVAsset?, audioMix: AVAudioMix?, info: [NSObject : AnyObject]?) in
 dispatch_async(dispatch_get_main_queue(), {
 
 let asset = asset as? AVURLAsset
 var data = NSData(contentsOfURL: asset.URL)
 })
 */

class InstagramHandler {

    enum PDWatermarkPosition {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        case defaultPos
    }

    enum ContentType {
        case video
        case image
    }

    func post(_ contentType:ContentType,_ content:Any) {
        switch contentType {
        case .video:
            guard let content = content as? Data else {
                //                CommonFunctions.showToastWithMessage("Could not post on Instagram : Invalid Content")
                return
            }
            postToStoryVideo(postVideoData: content)

        case .image:
            guard let content = content as? UIImage else {
                //                CommonFunctions.showToastWithMessage("Could not post on Instagram : Invalid Content")
                return
            }
            postToStoryImage(postImage: content)
        }
    }

    private func postToStoryImage(postImage imagetoPost:UIImage) {
        if let storiesUrl = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(storiesUrl) {
                let image = imagetoPost
                            guard let watermarked = addVIDAWatermark(toImage: image) else {
//                                CommonFunctions.showToastWithMessage("Could not add watermark")
                                return
                                }
                            guard let imageData = watermarked.pngData() else { return }
                let captionString = "caption"

                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#F0F8FF",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#F0F8FF",
                    "com.instagram.sharedSticker.contentURL": "lumi://app"
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate:
                        Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options:
                                                pasteboardOptions)
                UIApplication.shared.open(storiesUrl, options: [:],
                                          completionHandler: nil)
            } else {
                //            CommonFunctions.showToastWithMessage("Instagram not installed on device, please try again later.")
                debugPrint("Instagram not installed on device, please try again later.")
            }
        }
    }

    private func postToStoryVideo(postVideoData:Data) {
        //          let video = try Data(contentsOf: URL(fileURLWithPath: path))
        if let storiesUrl = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(storiesUrl) {
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.backgroundVideo": postVideoData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#000000",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#000000"
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate:
                        Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options:
                                                pasteboardOptions)
                UIApplication.shared.open(storiesUrl, options: [:],
                                          completionHandler: nil)
            } else {
                //            CommonFunctions.showToastWithMessage("Instagram not installed on device, please try again later.")
            }
        }
    }

    private func addVIDAWatermark(toImage image:UIImage)->UIImage? {
        let img = image
        var imgToTint = UIImage(named: "insta_watermark")
        imgToTint = imgToTint?.withTintColor(.white) ?? UIImage(named: "insta_watermark")!
        let img2 = imgToTint ?? UIImage(named: "klaunch-screen-vidalogo")!
        let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
        
        UIGraphicsBeginImageContextWithOptions(img.size, true, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            //                CommonFunctions.showToastWithMessage("No Context")
            return nil
        }
        //            context.setFillColor(AppColors.white.cgColor)
        context.fill(rect)
        
        img.draw(in: rect, blendMode: .normal, alpha: 1)
        img2.draw(in: getDimensionsForWatermark(rect), blendMode: .normal, alpha: 1)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
            }
    private func getDimensionsForWatermark(_ rect:CGRect)->CGRect {
        var height = rect.height * 0.075
        if height > 2600 {
            height = 2600
        }
        let width = height
        let x = rect.width * 0.05
        let y = x
        return CGRect(x: x, y: y, width: width, height: height)
    }
    //     private func watermark(video videoAsset:AVAsset, imageName name : String, watermarkText text : String , saveToLibrary flag : Bool, watermarkPosition position : PDWatermarkPosition, completion : ((_ status : AVAssetExportSession.Status?, _ session: AVAssetExportSession?, _ outputURL : URL?) -> ())?) {
    //        watermark(video: videoAsset, imageName: name, watermarkText: text, saveToLibrary: flag, watermarkPosition: position) { (status, session, outputURL) -> () in
    //                completion!(status, session, outputURL)
    //            }
    //        }
    
    private func watermark(video videoAsset:AVAsset, watermarkText text : String!, imageName name : String!, saveToLibrary flag : Bool, watermarkPosition position : PDWatermarkPosition, completion : ((_ status : AVAssetExportSession.Status?, _ session: AVAssetExportSession?, _ outputURL : URL?) -> ())?) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            let mixComposition = AVMutableComposition()
            
            let compositionVideoTrack = mixComposition.addMutableTrack(withMediaType: AVMediaType.video, preferredTrackID: Int32(kCMPersistentTrackID_Invalid))
            
            if videoAsset.tracks(withMediaType: AVMediaType.video).isEmpty {
                completion!(nil, nil, nil)
                return
            }
            
            let clipVideoTrack =  videoAsset.tracks(withMediaType: AVMediaType.video)[0]
            do {
                try compositionVideoTrack?.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration: videoAsset.duration), of: clipVideoTrack, at: CMTime.zero)
            } catch {
                print(error.localizedDescription)
            }
            let videoSize = clipVideoTrack.naturalSize
            
            print("videoSize--\(videoSize)")
            let parentLayer = CALayer()
            
            let videoLayer = CALayer()
            
            parentLayer.frame = CGRect(x: 0, y: 0, width: videoSize.width, height: videoSize.height)
            videoLayer.frame = CGRect(x: 0, y: 0, width: videoSize.width, height: videoSize.height)
            parentLayer.addSublayer(videoLayer)
            
            if name != nil {
                let watermarkImage = UIImage(named: name)
                let imageLayer = CALayer()
                imageLayer.contents = watermarkImage?.cgImage
                
                var xPosition : CGFloat = 0.0
                var yPosition : CGFloat = 0.0
                let imageSize : CGFloat = 57.0
                switch (position) {
                case .topLeft:
                    xPosition = 0
                    yPosition = 0
                case .topRight:
                    xPosition = videoSize.width - imageSize - 30
                    yPosition = 30
                case .bottomLeft:
                    xPosition = 0
                    yPosition = videoSize.height - imageSize
                case .bottomRight, .defaultPos:
                    xPosition = videoSize.width - imageSize
                    yPosition = videoSize.height - imageSize
                }
                imageLayer.frame = CGRect(x: xPosition, y: yPosition, width: imageSize, height: imageSize)
                imageLayer.opacity = 0.65
                parentLayer.addSublayer(imageLayer)
                if text != nil {
                    let titleLayer = CATextLayer()
                    titleLayer.backgroundColor = UIColor.clear.cgColor
                    titleLayer.string = text
                    titleLayer.font = "Helvetica" as CFTypeRef
                    titleLayer.fontSize = 20
                    titleLayer.alignmentMode = CATextLayerAlignmentMode.right
                    titleLayer.frame = CGRect(x: 0, y: yPosition - imageSize, width: videoSize.width - imageSize/2 - 4, height: 57)
                    titleLayer.foregroundColor = UIColor.red.cgColor
                    parentLayer.addSublayer(titleLayer)
                }
            }
            
            let videoComp = AVMutableVideoComposition()
            videoComp.renderSize = videoSize
            videoComp.frameDuration = CMTimeMake(value: 1, timescale: 30)
            videoComp.animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
            let instruction = AVMutableVideoCompositionInstruction()
            instruction.timeRange = CMTimeRangeMake(start: CMTime.zero, duration: mixComposition.duration)
            instruction.backgroundColor = UIColor.gray.cgColor
            _ = mixComposition.tracks(withMediaType: AVMediaType.video)[0] as AVAssetTrack
            
            guard let compositionVideoTrack = compositionVideoTrack else {
                return
            }
            
            let layerInstruction = self.videoCompositionInstructionForTrack(track: compositionVideoTrack, asset: videoAsset)
            
            instruction.layerInstructions = [layerInstruction]
            videoComp.instructions = [instruction]
            
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            let date = dateFormatter.string(from: Date())
            
            let url = URL(fileURLWithPath: documentDirectory).appendingPathComponent("watermarkVideo-\(date).mov")
            
            let exporter = AVAssetExportSession(asset: mixComposition, presetName: AVAssetExportPresetHighestQuality)
            exporter?.outputURL = url
            exporter?.outputFileType = AVFileType.mov
            exporter?.shouldOptimizeForNetworkUse = false
            exporter?.videoComposition = videoComp
            
            exporter?.exportAsynchronously() {
                DispatchQueue.main.async {
                    if exporter?.status == AVAssetExportSession.Status.completed {
                        let outputURL = exporter?.outputURL
                        if flag {
                            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(outputURL!.path) {
                                PHPhotoLibrary.shared().performChanges({
                                    PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: outputURL!)
                                }) { saved, error in
                                    if saved {
                                        completion!(AVAssetExportSession.Status.completed, exporter, outputURL)
                                    }
                                }
                            }
                            
                        } else {
                            completion!(AVAssetExportSession.Status.completed, exporter, outputURL)
                        }
                        
                    } else {
                        // Error
                        completion!(exporter?.status, exporter, nil)
                    }
                }
            }
        }
    }
    private func videoCompositionInstructionForTrack(track: AVCompositionTrack, asset: AVAsset) -> AVMutableVideoCompositionLayerInstruction {
        let instruction = AVMutableVideoCompositionLayerInstruction(assetTrack: track)
        let assetTrack = asset.tracks(withMediaType: AVMediaType.video)[0]
        
        let transform = assetTrack.preferredTransform
        let assetInfo = orientationFromTransform(transform: transform)
        
        var scaleToFitRatio = UIScreen.main.bounds.width / 375
        if assetInfo.isPortrait {
            scaleToFitRatio = UIScreen.main.bounds.width / assetTrack.naturalSize.height
            let scaleFactor = CGAffineTransform(scaleX: scaleToFitRatio, y: scaleToFitRatio)
            instruction.setTransform(assetTrack.preferredTransform.concatenating(scaleFactor),
                                     at: CMTime.zero)
        } else {
            let scaleFactor = CGAffineTransform(scaleX: scaleToFitRatio, y: scaleToFitRatio)
            var concat = assetTrack.preferredTransform.concatenating(scaleFactor).concatenating(CGAffineTransform(translationX: 0, y: 0))
            if assetInfo.orientation == .down {
                let fixUpsideDown = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                let windowBounds = UIScreen.main.bounds
                let yFix = 375 + windowBounds.height
                let centerFix = CGAffineTransform(translationX: assetTrack.naturalSize.width, y: CGFloat(yFix))
                concat = fixUpsideDown.concatenating(centerFix).concatenating(scaleFactor)
            }
            instruction.setTransform(concat, at: CMTime.zero)
            
        }
        
        return instruction
    }
    private func orientationFromTransform(transform: CGAffineTransform) -> (orientation: UIImage.Orientation, isPortrait: Bool) {
        var assetOrientation = UIImage.Orientation.up
        var isPortrait = false
        if transform.a == 0 && transform.b == 1.0 && transform.c == -1.0 && transform.d == 0 {
            assetOrientation = .right
            isPortrait = true
        } else if transform.a == 0 && transform.b == -1.0 && transform.c == 1.0 && transform.d == 0 {
            assetOrientation = .left
            isPortrait = true
        } else if transform.a == 1.0 && transform.b == 0 && transform.c == 0 && transform.d == 1.0 {
            assetOrientation = .up
        } else if transform.a == -1.0 && transform.b == 0 && transform.c == 0 && transform.d == -1.0 {
            assetOrientation = .down
        }
        
        return (assetOrientation, isPortrait)
    }
}
