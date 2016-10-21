//
//  UIView+Convenience.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 21/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

extension UIView {
    
    
    /// Moves the view on top of all sibling subviews within the superview (so that it appears on top of its siblings).
    /// In other words: Moves the view to the end of the array of the subviews property of its superview.
    open func bringToFront() {
        guard let superview = self.superview else {
            logError("superview is nil!")
            return
        }
        superview.bringSubview(toFront: self)
    }
}
