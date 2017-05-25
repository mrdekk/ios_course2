//
//  CarEntity+CoreDataProperties.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 24.05.17.
//  Copyright © 2017 Yandex. All rights reserved.
//

import Foundation
import CoreData


extension CarEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CarEntity> {
        return NSFetchRequest<CarEntity>(entityName: "Car");
    }

    @NSManaged public var mark: String?
    @NSManaged public var model: String?
    @NSManaged public var dummy: String?
    @NSManaged public var owner: PersonEntity?

}
