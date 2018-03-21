//
//  DogEntity+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 24.05.17.
//  Copyright © 2017 Yandex. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension DogEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DogEntity> {
        return NSFetchRequest<DogEntity>(entityName: "Dog");
    }

    @NSManaged public var color: String?
    @NSManaged public var high: Double
    @NSManaged public var owner: PersonEntity?

}
