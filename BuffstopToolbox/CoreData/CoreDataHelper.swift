//
//  CoreDataHelper.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 02/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation
import CoreData

public class CoreDataHelper {
    
    static public func fetchAll<T:NSManagedObject>(ofManagedObjectContext moc: NSManagedObjectContext,  completionHandler: @escaping (_ fetchedResult: [T]?, _ error: Error?) -> Void) {
        moc.perform {
            let fetchRequest = T.fetchRequest()
            do {
                let fetchResult = try fetchRequest.execute() as! [T]
                completionHandler(fetchResult, nil) //->
            } catch {
                completionHandler(nil, error) //->
            }
        }
    }
    
}