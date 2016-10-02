//
//  TestEntity+CoreDataProperties.swift
//  
//
//  Created by Andreas Buff on 02/10/16.
//
//

import Foundation
import CoreData


extension TestEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestEntity> {
        return NSFetchRequest<TestEntity>(entityName: "TestEntity");
    }

    @NSManaged public var testStringAtribute: String?

}
