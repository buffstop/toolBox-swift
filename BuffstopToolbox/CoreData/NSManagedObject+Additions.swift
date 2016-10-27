//
//  NSManagedObjectAdditions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 01/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import CoreData

public extension NSManagedObject {
    
    static public func uniqueID() -> String {
        let uuid = UUID().uuidString
        let dateString = "\(Date().timeIntervalSince1970)"
        
        return uuid + ":" + dateString
    }
}
