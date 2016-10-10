//
//  MSSticker+AdditionsTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 10/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
@testable import BuffstopToolbox
import Messages

class MSSticker_AdditionsTests: XCTestCase {
    
    func testAnimated() {
        let bundle = Bundle(for: type(of: self))
        let animatedPng = bundle.url(forResource: "animated", withExtension: "png")!
        let sticker = try! MSSticker(contentsOfFileURL: animatedPng, localizedDescription: "")
        let isAnimatable = sticker.isAnimateAble()
        XCTAssertTrue(isAnimatable)
    }
    
    func testNotAnimated() {
        let bundle = Bundle(for: type(of: self))
        let notAnimatedPng = bundle.url(forResource: "not_animated", withExtension: "png")!
        let sticker = try! MSSticker(contentsOfFileURL: notAnimatedPng, localizedDescription: "")
        let isAnimatable = sticker.isAnimateAble()
        XCTAssertFalse(isAnimatable)
    }
}
