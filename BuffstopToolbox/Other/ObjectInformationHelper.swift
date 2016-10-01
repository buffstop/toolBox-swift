//
//  ObjectInformationHelper.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 01/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

class ObjectInformationHelper {
    
    /// Returns the name of the class of a given object (instance of this class)
    ///
    /// - parameter instance: object to get the class name of
    ///
    /// - returns: name of class
    public static func className(ofObject instance:AnyObject) -> String {
        return String(describing: type(of: instance))
    }
}
