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
        let className = String(describing: type(of: self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd-HH-mm-ss"
        let dateString = dateFormatter.string(from: Date())
        
        let uuid = UUID().uuidString
        
        return className + "_" + uuid + "_" + dateString
    }
}
