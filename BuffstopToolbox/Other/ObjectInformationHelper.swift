//
//  ObjectInformationHelper.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 01/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

class ObjectInformationHelper {
    
    /// Returns the name of the class of a given object.
    ///
    /// - parameter instance: object to get the class name of
    ///
    /// - returns: name of class
    public static func className(ofObject instance:AnyObject) -> String {
        let rawName = String(describing: type(of: instance))
        
        if !rawName.contains(".") { // might be "ClassName" or "Module.ClassName"
            return rawName
        }

        let split:[String] = rawName.components(separatedBy: ".")
        
        return split.last!
    }
}
