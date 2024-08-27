//
//  CoreDataManager.swift
//  iosChallenge
//
//  Created by Marcos Costa on 26/08/24.
//

import Foundation

import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "RepoModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                #if DEBUG
                    print("Error loading Core Data: \(error.localizedDescription)")
                #endif
            }
        }
        context = container.viewContext
    }
    
    func save () {
        do {
            try context.save()
            #if DEBUG
                print("Saved successfuly.")
            #endif
        } catch let error {
            #if DEBUG
                print("Error saving Core Data: \(error)")
            #endif
        }
    }
}
