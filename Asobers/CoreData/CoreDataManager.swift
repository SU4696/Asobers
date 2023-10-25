//
//  CoreDataManager.swift
//  Asobers
//
//  Created by Suyeon Cho on 24/10/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    private let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ItemDataModel")
        let description = persistentContainer.persistentStoreDescriptions.first
        // This allows a 'non-iCloud' sycning
        // container to keep track of changes
        // as if it was an iCloud syncing container

        description?.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
