//
//  NSSearchPathForDirectoriesInDomains+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 08/11/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public extension FileManager {
    
    
    /// Returns Documents directories URL
    ///
    /// - Returns: Documents directory
    public static func documentsDirectory() -> URL {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
}
