//
//  String+UnicodeTests.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 10/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import XCTest
@testable import BuffstopToolbox

class String_UnicodeTests: XCTestCase {

    // MARK: - Backlash U Escaped   \\u{1234}
    func testSingleEscaped() {
        let input = "\\u{1f600}"
        let expected = "\u{1f600}"
        guard
            let result = String.toUnicodeCharacter(fromEscapedBackslashURepresentation: input) as String?
            else {
                XCTFail("Must not throw with valid input")
                return
        }
        
        XCTAssertTrue(result == expected)
    }
    
    func testDoubleEscaped() {
        let input = "\\u{1f1ef}\\u{1f1f5}"
        let expected = "\u{1f1ef}\u{1f1f5}"
        guard
            let result = String.toUnicodeCharacter(fromEscapedBackslashURepresentation: input) as String?
            else {
                XCTFail("Must not throw with valid input")
                return
        }

        XCTAssertTrue(result == expected)
    }

    // MARK: - Numeric Codes        &#x1234;
    
    func testSingleNumeric() {
        let input = "&#x1f600;"
        let expected = "\u{1f600}"
        guard
            let result = String.toUnicodeCharacter(fromNumericRepresentation: input) as String?
            else {
                XCTFail("Must not throw with valid input")
                return
        }

        XCTAssertTrue(result == expected)
    }
    
    func testDoubleNumeric() {
        let input = "&#x1f1ef;&#x1f1f5;"
        let expected = "\u{1f1ef}\u{1f1f5}"
        guard
            let result = String.toUnicodeCharacter(fromNumericRepresentation: input) as String?
            else {
                XCTFail("Must not throw with valid input")
                return
        }
        
        XCTAssertTrue(result == expected)
    }
}
