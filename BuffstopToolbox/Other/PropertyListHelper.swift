//
//  PropertyListHelper.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 09/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public extension Bundle {
    static public func plistDictionary(fromPlistNamed plistName: String) throws -> AnyObject {
        let path = self.main.path(forResource: plistName, ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url)
        let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        
        return plist as AnyObject
    }
}
