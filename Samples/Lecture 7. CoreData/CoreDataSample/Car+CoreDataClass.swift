//
//  Car+CoreDataClass.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 16.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Car)
public class Car: NSManagedObject {
    static let entityName = "Car"

    static func buildDescription(in context: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: Car.entityName, in: context)
    }
}
