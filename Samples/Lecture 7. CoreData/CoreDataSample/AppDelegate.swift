//
//  AppDelegate.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 16.04.18.
//  Copyright © 2018 Yandex. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
    func recursiveSave() throws {
        var err: Error? = nil
        self.performAndWait {
            do {
                try save()
                if let parent = self.parent {
                    try parent.recursiveSave()
                }
            } catch {
                err = error
            }
        }
        if let error = err {
            throw error
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var storeCoordinator: NSPersistentStoreCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let url = Bundle.main.url(forResource: "CarsModel", withExtension: "momd")!
        let model = NSManagedObjectModel(contentsOf: url)!

        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let sqlitePath = path.appendingPathComponent("cars.sqlite")
        NSLog("Path: \(sqlitePath.absoluteString)")

        storeCoordinator.performAndWait {
            do {
                let options = [
                    NSMigratePersistentStoresAutomaticallyOption: true,
                    NSInferMappingModelAutomaticallyOption: true
                ]
                let store = try storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlitePath, options: options)
            } catch {
                NSLog("oops \(error)")
            }
        }

        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = storeCoordinator

        context.performAndWait {
            let desc = Car.buildDescription(in: context)!
            let car = Car(entity: desc, insertInto: context)
            car.mark = "Honda"
            car.model = "Integra"

            try! context.save()
        }

        let context2 = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context2.parent = context

        context2.performAndWait {
            let request: NSFetchRequest<Car> = NSFetchRequest(entityName: Car.entityName)
            request.predicate = NSPredicate(format: "mark = 'Honda'")

            let cars = try! context2.fetch(request)
            NSLog("\(cars)")
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

