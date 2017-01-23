//
//  UIView+XIB.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 22/01/17.
//  Copyright © 2017 buffhaltestelle. All rights reserved.
//

import Foundation

extension UIView {
    class func fromNib() -> UIView? {
        guard
            let nibs = Bundle(for: self).loadNibNamed(String(describing: self), owner: nil, options: nil),
            let nib = nibs.first
            else {
                return nil
        }
        
        return nib as? UIView
    }
    
}
