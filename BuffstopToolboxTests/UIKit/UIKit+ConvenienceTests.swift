//
//  UIKit+Convenience.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 21/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest

class UIKit_Convenience: XCTestCase {
    
    func testToFront() {
        let superview = UIView()
        //add test view
        let testView = UIView()
        superview.addSubview(testView)
        // add view above testview
        let disturbingView = UIView()
        superview.addSubview(disturbingView)
        // test view is not on top
        var curFirstObject = superview.subviews.last
        XCTAssertTrue(curFirstObject != testView)
    
        testView.bringToFront()
        // test view is on top now
        curFirstObject = superview.subviews.last
        XCTAssertTrue(curFirstObject == testView)
    }
}
