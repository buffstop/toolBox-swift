//
//  EscapedUnicodeConverter.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 10/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public typealias RegexPatter = String

public enum UnicodeConverterPattern: RegexPatter {
    case escapedBackSlashU = "\\\\u\\{([0-9A-Fa-f]+)\\}"    //Example: "\\u{1f1ef}\\u{1f1f5}"
    case numericReference = "&#x([0-9A-Fa-f]+);"            //Example: "&#x1f1ef;&#x1f1f5;"
}

public class UnicodeConverter: NSRegularExpression {
    //let unicodeConverterForSwift = try! EscapedUnicodeConverter(pattern: "&#x([0-9A-Fa-f]+);")
    override public func replacementString(for result: NSTextCheckingResult, in string: String, offset: Int, template templ: String) -> String {
        if
            result.numberOfRanges == 2,
            case let nsString = string as NSString,
            case let matchedString = nsString.substring(with: result.rangeAt(1)),
            let unicodeScalarValue = UInt32(matchedString, radix: 16),
            let unicodeScalar = UnicodeScalar(unicodeScalarValue)
        {
            return String(unicodeScalar)
        } else {
            return super.replacementString(for: result, in: string, offset: offset, template: templ)
        }
    }
}
