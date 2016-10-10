//
//  String+Unicode.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 10/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public extension String {
    
    /// Converts a numeric representation of a unicode character to an actual unicode character.
    ///
    /// Example:
    ///
    ///     let numeric = "&#x1f1ef;&#x1f1f5"
    ///     let result = str.toUnicodeCharacter(fromNumericRepresentation: numeric)
    ///     print("\(result)")
    ///     🇯🇵
    ///
    /// - parameter numeric: the numeric representaion of one ore more unicode characters
    ///
    /// - returns: the represented unicode character
    public static func toUnicodeCharacter(fromNumericRepresentation numeric: String) -> String {
        return self.toUnicodeCharacter(fromRepresentation: numeric, usingRegexPattern: UnicodeConverterPattern.numericReference)
    }
    
    /// Converts a escaped representation of a unicode character to an actual unicode character.
    ///
    /// Example:
    ///
    ///     let escaped = "\\u{1f1ef}\\u{1f1f5}"
    ///     let result = str.toUnicodeCharacter(fromEscapedBackslashURepresentation: escaped)
    ///     print("\(result)")
    ///     🇯🇵
    ///
    /// - parameter numeric: the escaped representaion of one ore more unicode characters
    ///
    /// - returns: the represented unicode character
    public static func toUnicodeCharacter(fromEscapedBackslashURepresentation numeric: String) -> String {
        return self.toUnicodeCharacter(fromRepresentation: numeric, usingRegexPattern: UnicodeConverterPattern.escapedBackSlashU)
    }
    
    // MARK: - HELPER
    
    fileprivate static func toUnicodeCharacter(fromRepresentation convertee: String, usingRegexPattern pattern: UnicodeConverterPattern) -> String {
        let unicodeConverter = try! UnicodeConverter(pattern: pattern.rawValue)
        let result = unicodeConverter.stringByReplacingMatches(in: convertee, range: NSRange(0..<convertee.utf16.count), withTemplate: "???")
        
        return result
    }
    
    
}
