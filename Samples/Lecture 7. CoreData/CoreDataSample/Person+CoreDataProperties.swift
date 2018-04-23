//
//  Person+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 16.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var fio: String?
    @NSManaged public var birthDate: NSDate?
    @NSManaged public var cars: NSSet?

}

// MARK: Generated accessors for cars
extension Person {

    @objc(addCarsObject:)
    @NSManaged public func addToCars(_ value: Car)

    @objc(removeCarsObject:)
    @NSManaged public func removeFromCars(_ value: Car)

    @objc(addCars:)
    @NSManaged public func addToCars(_ values: NSSet)

    @objc(removeCars:)
    @NSManaged public func removeFromCars(_ values: NSSet)

}
