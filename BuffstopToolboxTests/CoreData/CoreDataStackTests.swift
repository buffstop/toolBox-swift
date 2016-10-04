//
//  CoreDataStackTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 04/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest

import Foundation
import CoreData
@testable import BuffstopToolbox

class CoreDataStackTests: XCTestCase {
    
    var coreDataStack = TestCoreDataStack()
    let testEntity = "TestEntity"
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
    }
    
    // MARK: - FetchAll
    
    func testMainContextCreateAndFetchEntityAsync() {
        let expectation = self.expectation(description: "returns")
        let moc = coreDataStack.mainContext()
        moc.perform {
            //createe entity
            let uuid = UUID().uuidString
            let createe = TestEntity(context: moc)
            createe.testStringAtribute = uuid
            self.coreDataStack.save()
            
            //fetch entity
            moc.perform({ 
                let fetchRequest:NSFetchRequest<TestEntity> = TestEntity.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "testStringAtribute == %@", uuid)
                let fetchedResults: [TestEntity] = try! fetchRequest.execute()
                XCTAssertTrue(fetchedResults.count == 1, "unique object can be fetched")
                let fetchedObject = fetchedResults.first! 
                XCTAssertEqual(fetchedObject.testStringAtribute, uuid)
                expectation.fulfill()
            })
        }

        waitForExpectations(timeout: xcTestCaseDefaultTimeout)
    }
    
    func testMainContextCreateAndFetchEntitySync() {
        let uuid = UUID().uuidString
        let moc = coreDataStack.mainContext()
        moc.performAndWait {
            //createe entity
            
            let createe = TestEntity(context: moc)
            createe.testStringAtribute = uuid
            self.coreDataStack.save()
            
        }
        
        var fetchedObject:TestEntity?
        //fetch entity
        moc.performAndWait {
            let fetchRequest:NSFetchRequest<TestEntity> = TestEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "testStringAtribute == %@", uuid)
            let fetchedResults: [TestEntity] = try! fetchRequest.execute()
            XCTAssertTrue(fetchedResults.count == 1, "unique object can be fetched")
            fetchedObject = fetchedResults.first!
        }
        XCTAssertEqual(fetchedObject?.testStringAtribute, uuid)
    }
    
    func testBackgroundContextCreateAndFetchEntityAsync() {
        let expectation = self.expectation(description: "returns")
        let mainMoc = coreDataStack.mainContext()
        let backgroundMoc = coreDataStack.newBackgroundContext()
        backgroundMoc.perform {
            //createe entity
            let uuid = UUID().uuidString
            let createe = TestEntity(context: backgroundMoc)
            createe.testStringAtribute = uuid
            try! backgroundMoc.save()
            
            //fetch entity
            mainMoc.perform({
                let fetchRequest:NSFetchRequest<TestEntity> = TestEntity.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "testStringAtribute == %@", uuid)
                let fetchedResults: [TestEntity] = try! fetchRequest.execute()
                XCTAssertTrue(fetchedResults.count == 1, "unique object can be fetched")
                let fetchedObject = fetchedResults.first!
                XCTAssertEqual(fetchedObject.testStringAtribute, uuid)
                expectation.fulfill()
            })
        }
        
        waitForExpectations(timeout: xcTestCaseDefaultTimeout)
    }
    
    func testBackgroundContextCreateAndFetchEntitySync() {
        let uuid = UUID().uuidString
        let mainMoc = coreDataStack.mainContext()
        let backgroundMoc = coreDataStack.newBackgroundContext()
        backgroundMoc.performAndWait {
            //createe entity
            
            let createe = TestEntity(context: backgroundMoc)
            createe.testStringAtribute = uuid
            try! backgroundMoc.save()
            
        }
        
        var fetchedObject:TestEntity?
        //fetch entity
        mainMoc.performAndWait {
            let fetchRequest:NSFetchRequest<TestEntity> = TestEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "testStringAtribute == %@", uuid)
            let fetchedResults: [TestEntity] = try! fetchRequest.execute()
            XCTAssertTrue(fetchedResults.count == 1, "unique object can be fetched")
            fetchedObject = fetchedResults.first!
        }
        XCTAssertEqual(fetchedObject?.testStringAtribute, uuid)
    }
}
