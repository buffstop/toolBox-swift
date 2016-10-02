//
//  NSManagedObjectAdditions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 01/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import CoreData

public extension NSManagedObject {
    
    public static var entityName:String {
        get {
            return ObjectInformationHelper.className(ofObject: self)
        }
    }
    
}
