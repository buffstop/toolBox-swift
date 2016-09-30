//
//  AppGroupHelper.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 27/09/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

/**
 Helpers for dealing with shared containers within one Apple App Group
 */
open class AppGroupHelper {
    let applicationGroupId:String
    
    /// Returns the URL to the app groups shared direcory
    ///
    /// - returns: shared directory
    public func groupDirectoryURL() -> URL {
        guard let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: applicationGroupId) else {
            fatalError("could not get shared app group directory.")
        }
        
        return groupURL
    }
    
    /// Inits and returns user defaults in/from the shared directory of your app group.
    ///
    /// - returns: shared user defaults
    public func sharedUserDefaults() -> UserDefaults {
        guard let sharedUserDefaults = UserDefaults(suiteName: applicationGroupId) else {
            fatalError("could not get user defaults for app group named \"\(applicationGroupId)\"")
        }
        
        return sharedUserDefaults
    }
        
    /// Designated initializer
    /// - Note: To make this class work, you have to:
    ///
    /// - Create an group ID in Apple Developer Member Center
    /// - Activate the group ID in your aps entitlements (Project -> Target -> Capabilities)
    ///
    /// - parameter groupId: Apple group identifier
    ///
    public init(withApplicationGroupId groupId:String) {
        applicationGroupId = groupId
    }
    
}
