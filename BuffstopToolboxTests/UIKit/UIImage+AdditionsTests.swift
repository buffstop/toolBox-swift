//
//  UIImage+AdditionsTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 05/12/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
@testable import BuffstopToolbox

class UIImage_AdditionsTests: XCTestCase {
    
    func testIsAnimatable_animated() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "animated", withExtension: "png")!
        let isAnimatable = UIImage.isAnimatable(imageFileAt: url)
        
        XCTAssertTrue(isAnimatable, "apng is animatable")
    }
    
    func testIsAnimatable_notAnimated() {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "not_animated", withExtension: "png")!
        let isAnimatable = UIImage.isAnimatable(imageFileAt: url)
        
        XCTAssertFalse(isAnimatable, "apng is animatable")
    }
}
