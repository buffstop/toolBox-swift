//
//  CommonErrors.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 10/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public enum ParsingError: Error, Equatable {
    case InvalidInput(input: String)
    case ParsingFailed(input: String)
}

public func ==(lhs: ParsingError, rhs: ParsingError) -> Bool {
    switch (lhs, rhs) {
    case (.InvalidInput(let leftMessage), .InvalidInput(let rightMessage)):
        return leftMessage == rightMessage
    case (.ParsingFailed(let leftMessage), .ParsingFailed(let rightMessage)):
        return leftMessage == rightMessage
    default:
        return false
    }    
}
