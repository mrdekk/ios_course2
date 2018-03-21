//
//  PersonEntity+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 24.05.17.
//  Copyright © 2017 Yandex. All rights reserved.
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "Person");
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var cars: NSSet?
    @NSManaged public var dogs: NSSet?

}

// MARK: Generated accessors for cars
extension PersonEntity {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: CarEntity)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: CarEntity)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}

// MARK: Generated accessors for dogs
extension PersonEntity {

    @objc(addDogsObject:)
    @NSManaged public func addToDogs(_ value: DogEntity)

    @objc(removeDogsObject:)
    @NSManaged public func removeFromDogs(_ value: DogEntity)

    @objc(addDogs:)
    @NSManaged public func addToDogs(_ values: NSSet)

    @objc(removeDogs:)
    @NSManaged public func removeFromDogs(_ values: NSSet)

}
