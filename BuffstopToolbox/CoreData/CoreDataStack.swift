//
//  CoreDataStack.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 27/09/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import CoreData
import Foundation

open class CoreDataStack {
    public private(set) var persistentContainer: NSPersistentContainer
    
    // MARK: Life Cycle
    
    public init(withManagedObjectModelName momdName:String, sqliteStoreName storeName:String, storeBaseUrl baseUrl:URL?) {
        guard let modelURL = Bundle(for: type(of: self)).url(forResource: momdName, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        persistentContainer = NSPersistentContainer(name: momdName, managedObjectModel: mom)
        
        // If a base URL is given, use it. Else use persistent stores default
        if let baseUrl = baseUrl {
            var storeUrl = baseUrl.appendingPathComponent(momdName)
            storeUrl = storeUrl.appendingPathExtension("sqlite")
            let description = NSPersistentStoreDescription(url: storeUrl)
            persistentContainer.persistentStoreDescriptions = [description]
        }
        
        persistentContainer.loadPersistentStores() { (storeDescription, error) in
            if let error = error {
                #if DEBUG
                    fatalError("Unresolved error \(error)")
                #else
                    logError("loadPersistentStores failed with Error: \(error) \nURL: \(self.persistentContainer.persistentStoreCoordinator.persistentStores.first!.url!)")
                #endif
            }
        })
    }
    
    // MARK: convenience
    
    public func mainContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    /// Returns a new background context by forwarding call to `NSPersistentContainer.newBackgroundContext()` plus setting the given options.
    ///
    /// - parameter enableAutoMerge: whether or not to automatically merges changes from parent context. Defaults to `true`.
    ///
    /// - returns: background context
    public func newBackgroundContext(automaticallyMergesChangesFromParent enableAutoMerge: Bool = true) -> NSManagedObjectContext {
        let moc = persistentContainer.newBackgroundContext()
        moc.automaticallyMergesChangesFromParent = enableAutoMerge
        return moc
    }
    
    // MAKR: - OTHER
    
    public func save() {
        let context = mainContext()
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
