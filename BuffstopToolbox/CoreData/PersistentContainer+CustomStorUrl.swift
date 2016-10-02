//
//  PersistentContainer+CustomStorUrl.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 02/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import CoreData

final public class PersistentContainer: NSPersistentContainer {
    private static var customUrl: URL?
    
    public init(name: String, managedObjectModel model: NSManagedObjectModel, customStoreDirectory baseUrl:URL?) {
        super.init(name: name, managedObjectModel: model)
        PersistentContainer.customUrl = baseUrl
    }
    
    override public class func defaultDirectoryURL() -> URL {
        return (customUrl != nil) ? customUrl! : super.defaultDirectoryURL()
    }
}
