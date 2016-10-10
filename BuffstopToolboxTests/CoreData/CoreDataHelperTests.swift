//
//  CoreDataHelperTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 02/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
@testable import BuffstopToolbox

class CoreDataHelperTests: XCTestCase {
    var coreDataStack = TestCoreDataStack()
    
    let testEntity = "TestEntity"
    
    override func setUp() {
        super.setUp()
        coreDataStack = TestCoreDataStack()
    }

    // MARK: - FetchAll
    
//    func testFetchAll() {
//        let expectation = self.expectation(description: "returns")
//        let moc = coreDataStack.persistentContainer.viewContext
//        CoreDataHelper.fetchAll(ofManagedObjectContext: moc) { (fetchedResult: [TestEntity]?, error:Error?) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(fetchedResult)
//            XCTAssert(fetchedResult!.count > 0)            
//            expectation.fulfill()
//        }
//        
//        waitForExpectations(timeout: xcTestCaseDefaultTimeout)
//    }
}
