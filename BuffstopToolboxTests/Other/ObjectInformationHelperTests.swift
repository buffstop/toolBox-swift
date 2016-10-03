//
//  ObjectInformationHelper
//
//  Created by Andreas Buff on 20/09/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
@testable import BuffstopToolbox

class ObjectInformationHelperTests: XCTestCase {
    
    func testClassNameSwift() {
        let testClass = ObjectInformationTestClassSwift()
        XCTAssertEqual(ObjectInformationHelper.className(ofObject: testClass), testClass.testClassName)
    }
    
    func testClassNameNSObject() {
        let testClass = ObjectInformationTestClassNSObject()
        XCTAssertEqual(ObjectInformationHelper.className(ofObject: testClass), testClass.testClassName)
    }
}
