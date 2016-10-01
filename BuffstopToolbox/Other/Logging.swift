//
//  Logging.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 01/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

/// Logs only in Debug mode
///
/// Prints the filename, function name, line number and textual representation of `object` and a newline character into the standard output if the build setting for "Active Complilation Conditions" (SWIFT_ACTIVE_COMPILATION_CONDITIONS) defines `DEBUG`.
///
/// The current thread is a prefix on the output. <MAIN_THREAD> for the main thread, <BACKGROUD_THREAD> for anything else.
///
/// Only the first parameter needs to be passed to this funtion.
/// The textual representation is obtained from the `object` using `String(reflecting:)` which works for _any_ type. To provide a custom format for the output make your object conform to `CustomDebugStringConvertible` and provide your format in the `debugDescription` parameter.
///
/// Use the same way as you would use a `print()` statement.
///
/// Taken and modified [from this source](https://github.com/JungleCandy/LoggingPrint/blob/master/LoggingPrint.swift)
///
/// - parameter object:   The object whose textual representation will be printed. If this is an expression, it is lazily evaluated.
/// - parameter file:     The name of the file, defaults to the current file without the ".swift" extension.
/// - parameter function: The name of the function, defaults to the function within which the call is made.
/// - parameter line:     The line number, defaults to the line number within the file that the call is made.

public func logInfo<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        logError(object, file, function, line)
    #endif
}

/// Always logs.
///
/// - note: Logging is expensive. use this wizely for real errors which you want see in system logs
///
/// Prints the filename, function name, line number and textual representation of `object` and a newline character into the standard output if the build setting for "Active Complilation Conditions" (SWIFT_ACTIVE_COMPILATION_CONDITIONS) defines `DEBUG`.
///
/// The current thread is a prefix on the output. <MAIN_THREAD> for the main thread, <BACKGROUD_THREAD> for anything else.
///
/// Only the first parameter needs to be passed to this funtion.
/// The textual representation is obtained from the `object` using `String(reflecting:)` which works for _any_ type. To provide a custom format for the output make your object conform to `CustomDebugStringConvertible` and provide your format in the `debugDescription` parameter.
///
/// Use the same way as you would use a `print()` statement.
///
/// Taken and modified [from this source](https://github.com/JungleCandy/LoggingPrint/blob/master/LoggingPrint.swift)
///
/// - parameter object:   The object whose textual representation will be printed. If this is an expression, it is lazily evaluated.
/// - parameter file:     The name of the file, defaults to the current file without the ".swift" extension.
/// - parameter function: The name of the function, defaults to the function within which the call is made.
/// - parameter line:     The line number, defaults to the line number within the file that the call is made.
public func logError<T>(_ object: @autoclosure () -> T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        let value = object()
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        let queue = Thread.isMainThread ? "MAIN_THREAD" : "BACKGROUD_THREAD"
        
        print("<\(queue)> \(fileURL) \(function)[\(line)]: " + String(reflecting: value))
}

