//
//  CoreDataStack.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 27/09/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import CoreData

open class CoreDataStack {
    public private(set) var persistentContainer: PersistentContainer
    
    // MARK: Life Cycle
    
    public init(withManagedObjectModelName momdName:String, sqliteStoreName storeName:String, storeBaseUrl baseUrl:URL?) {
        guard let modelURL = Bundle(for: type(of: self)).url(forResource: momdName, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        persistentContainer = PersistentContainer(name: "", managedObjectModel: mom, customStoreDirectory: baseUrl)
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
    }
    
    // MARK: convenience
    
    public func mainContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    public func newBackgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    // MAKR: Other
    
    public func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                logError("error saving MOC: \(error)")
                #if DEBUG
                    fatalError()
                #endif
            }
        }
    }
}