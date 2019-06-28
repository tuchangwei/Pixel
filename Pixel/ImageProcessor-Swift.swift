//
//  ImageProcessor-Swift.swift
//  Pixel
//
//  Created by tu on 2019/6/28.
//  Copyright © 2019 iSpeech. All rights reserved.
//

import Foundation
class ImageProcessor1 {
    class func processImage(image: UIImage) {
        guard let cgImage = image.cgImage else {
            return
        }
        let width = Int(image.size.width)
        let height = Int(image.size.height)
        let bytesPerRow = width * 4
        let imageData = UnsafeMutablePointer<UInt32>.allocate(capacity: width * height)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let bitmapInfo: UInt32 = CGBitmapInfo.byteOrder32Big.rawValue | CGImageAlphaInfo.premultipliedLast.rawValue
        guard let imageContext = CGContext(data: imageData, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return
        }
        imageContext.draw(cgImage, in: CGRect(origin: .zero, size: image.size))
        print("---------data from Swift version----------")
        for i in 0..<width * height {
            print(imageData[i])
        }
    }
}
