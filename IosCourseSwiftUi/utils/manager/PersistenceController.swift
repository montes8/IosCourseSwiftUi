//
//  PersistenceController.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import CoreData

struct PersistenceController {
    // singleton instancia que se usara en toda la app
    static let shared = PersistenceController()

    // Almacenamiento para datos básicos
    let container: NSPersistentContainer


    init(inMemory: Bool = false) {
    
        container = NSPersistentContainer(name: "IosCourseSwiftUi")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() throws{
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }
    
    func delete(_ object : NSManagedObject) throws{
        let context = container.viewContext
        context.delete(object )
         try save()
           
    }
}
