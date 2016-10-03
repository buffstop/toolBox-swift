//
//  NSManagedObject+AdditionsTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 02/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
import CoreData

class NSManagedObject_AdditionsTests: XCTestCase {
    let testEntity = "TestEntity"

    func testEntetyName() {
        let entityName = TestEntity.entityName
        XCTAssertEqual(entityName, self.testEntity)
    }
    
    func testUuid() {
        let uuid = TestEntity.uniqueID()
        XCTAssertNotNil(uuid)
    }
}
