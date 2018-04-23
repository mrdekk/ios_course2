//
//  Car+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 16.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: Car.entityName)
    }

    @NSManaged public var mark: String?
    @NSManaged public var model: String?
    @NSManaged public var owner: Person?

}
