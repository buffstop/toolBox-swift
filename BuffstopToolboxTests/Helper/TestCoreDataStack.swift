//
//  TestCoreDataStack.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 02/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation
import BuffstopToolbox

class TestCoreDataStack: CoreDataStack {
    let managedObjectModelName = "TestModel"
    let sqliteStoreName = "testStore"
    let testEntityName = "TestEntity"
    
    init() {
        super.init(withManagedObjectModelName: managedObjectModelName, sqliteStoreName: sqliteStoreName, storeBaseUrl: nil)
        setupTestData()
    }

    private func setupTestData() {
        let new = TestEntity(context: self.persistentContainer.viewContext)
        new.testStringAtribute = "value1"
        
        let new2 = TestEntity(context: self.persistentContainer.viewContext)
        new2.testStringAtribute = "value2"
        
        self.save()
    }
}
