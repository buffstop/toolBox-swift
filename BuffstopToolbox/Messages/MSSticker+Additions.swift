//
//  MSSticker+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 09/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Messages
import ImageIO

public extension MSSticker {
    
    /// Figures out whether or not the sticker is animatable by counting the used images frames. We assume the image is animatable if it contains more than one frame
    ///
    /// - returns: true if the contained image holds more than one frame. false otherwize
    public func isAnimateAble() -> Bool {
        return UIImage.isAnimatable(imageFileAt: self.imageFileURL)
    }
}
