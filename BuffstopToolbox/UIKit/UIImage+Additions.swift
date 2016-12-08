//
//  UIImage+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 21/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import UIKit
import ImageIO

extension UIImage {
    
    /// Creates a bunch of images from files in app bundle.
    /// Filenames which no image file can be found for are ignored.
    ///
    /// - parameter names: names of image files to create images from
    ///
    /// - returns: images
    static public func images(with names: [String]) -> [UIImage] {
        return  names
            .map { UIImage(named: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
    
    /// Figures out whether or not an image is animatable by counting the used images frames. We assume the image is animatable if it contains more than one frame
    ///
    /// - returns: true if the contained image holds more than one frame. false otherwize
    static func isAnimatable(imageFileAt url:URL) -> Bool {
        guard let imageSource = CGImageSourceCreateWithURL(url as CFURL , nil) else { return false }
        let frameCount = CGImageSourceGetCount(imageSource)
        return frameCount > 1
    }
}
