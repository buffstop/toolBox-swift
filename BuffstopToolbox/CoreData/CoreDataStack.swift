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
        
        //FIXME: we ignore the base URL in the moment. Background: the commented approach works only, if a .sqlite file already exists, not when initializing the stack the first time.
        
        //        if baseUrl != nil {
        //            let description = NSPersistentStoreDescription(url: baseUrl!)
        //            persistentContainer.persistentStoreDescriptions = [description]
        //        }
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
    
    // MARK: - DEBUG
    
    /**
      In case we are using a shared container, it might help to have the model in AppContatiner/documents to quickly be able to downoad it via Xcode for debugging.
     */
    public func debug_copyModelToDocuments() {
        print("persistentStore URL: \(persistentContainer.persistentStoreCoordinator.persistentStores.first!.url!)")
        
        //-> persistentStore URL: file:///var/mobile/Containers/Data/PluginKitPlugin/9C15B67C-8917-4A24-9FB0-BD119C43B3C4/Library/Application%20Support/Model.sqlite
        
        let documentsPath = FileManager.documentsDirectory()
        let targetPath = "\(documentsPath)DebugEvalutation_\(Date())_Model.sqlite"
        
        print("targetPath: " + targetPath)
        
        let fileManager = FileManager.default
        do {
            try fileManager.copyItem(at: persistentContainer.persistentStoreCoordinator.persistentStores.first!.url!, to: URL(fileURLWithPath: targetPath))
        } catch let error as NSError {
            logError("Ooops! Something went wrong: \(error)")
        }
    }
}
