//
//  CoreDataStack.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 27/09/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation
import CoreData

open class CoreDataStack {
    // MARK: - Managed object contexts
    
    /** main context. Use only to read. Can be used from every thread */
    var mainManagedObjectContext: NSManagedObjectContext
    /** write context. Must be used for writes, reads are also allowed though */
    var privateManagedObjectContext: NSManagedObjectContext
    
    // MARK: - Object lifecycle
    
    public init(withManagedObjectModelName momdName:String, sqliteStoreName storeName:String, storeBaseUrl baseUrl:URL?) {
        // This resource is the same name as your xcdatamodeld contained in your project.
        guard let modelURL = Bundle.main.url(forResource: momdName, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        mainManagedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainManagedObjectContext.persistentStoreCoordinator = psc
        
        // Check if custom base URL has been passed ...
        let docURL:URL
        if baseUrl != nil {
            docURL = baseUrl!
        } else { // ... otherwize use default
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            docURL = urls[urls.endIndex-1]
        }

        /* The directory the application uses to store the Core Data store file.
         This code uses a file named "DataModel.sqlite" in the application's documents directory.
         */
        let storeFileName = storeName + ".sqlite"
        let storeURL = docURL.appendingPathComponent(storeFileName)
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        privateManagedObjectContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateManagedObjectContext.parent = mainManagedObjectContext
    }
    
    deinit {
        do {
            try self.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
}
