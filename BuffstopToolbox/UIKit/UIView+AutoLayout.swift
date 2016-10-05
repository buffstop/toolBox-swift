//
//  UIView+AutoLayout.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 05/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public extension UIView {
    
    public enum Constrains {
        case FullSizeInSuperview
    }
    
    //MARK: - PUBLIC API
    public func addConstraints(_ constraints: Constrains) {
        switch constraints {
        case .FullSizeInSuperview:
            self.fullSizeInSuperview()
        }
        
    }
    
    //MARK: - OTHER
    
    fileprivate func fullSizeInSuperview() {
        guard let superview = self.superview else {
            logError("superview is nil?")
            #if DEBUG
                fatalError()
            #else
                return
            #endif
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
}
