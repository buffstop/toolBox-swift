//
//  UIImageView+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 21/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import UIKit

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
}
