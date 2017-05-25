//
//  AppDelegate.swift
//  CoreDataSample
//
//  Created by Denis Malykh on 21.05.17.
//  Copyright © 2017 Yandex. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var model: NSManagedObjectModel!
    var coordinator: NSPersistentStoreCoordinator!
    
    var mainContext: NSManagedObjectContext!
    var privateContext: NSManagedObjectContext!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        guard let url = Bundle.main.url(forResource: "Model", withExtension: "momd") else {
            // process error
            return false
        }
        
        model = NSManagedObjectModel(contentsOf: url)
        
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        mainContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        mainContext.persistentStoreCoordinator = coordinator
        
        privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.parent = mainContext
        
        DispatchQueue.global().async { [weak self] in
            guard let sself = self else { return }
            do {
                let docurl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
                let storeurl = docurl.appendingPathComponent("model.sqlite")
                _ = try sself.coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeurl, options: [NSMigratePersistentStoresAutomaticallyOption: NSNumber(value: true as Bool), NSInferMappingModelAutomaticallyOption: NSNumber(value: true as Bool)])
                
                
                sself.privateContext.performAndWait { [weak self] in
                    guard let sself = self else { return }
                    let desc = NSEntityDescription.entity(forEntityName: "Car", in: sself.privateContext)
                    let car = CarEntity(entity: desc!, insertInto: sself.privateContext)
                    car.mark = "Honda"
                    car.model = "Integra #\(Date().timeIntervalSince1970)"
                    
                    do {
                        try sself.privateContext.save()
                        sself.mainContext.performAndWait { [weak self] in
                            guard let sself = self else { return }
                            do {
                                try sself.mainContext.save()
                            } catch {
                                
                            }
                        }
                    } catch {
                        
                    }
                }
                
                sself.privateContext.performAndWait { [weak self] in
                    guard let sself = self else { return }
                    
                    let mark = "Honda"
                    let pred = NSPredicate(format: "mark == %@", mark)
                    let sort = NSSortDescriptor(key: "model", ascending: true)
                    
                    //let req: NSFetchRequest<CarEntity> = NSFetchRequest(entityName: "Car")
                    let req: NSFetchRequest<CarEntity> = CarEntity.fetchRequest()
                    req.predicate = pred
                    req.sortDescriptors = [sort]
                    
                    do {
                        let res = try sself.privateContext.fetch(req) as! [CarEntity]
                        print(res.flatMap { $0.model })
                    } catch {
                        
                    }
                }
                
            } catch {
            
            }
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
        // Saves changes in the application's managed object context before the application terminates.
    }
}

