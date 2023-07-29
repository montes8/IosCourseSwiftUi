//
//  PersistenceController.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import CoreData
import Swinject
import SwinjectAutoregistration


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

@propertyWrapper
struct Inject<Component> {
    
    var component: Component
    
    init() {
        self.component = Resolver.shared.resolve(Component.self)
    }
    
    public var wrappedValue:Component {
        get { return component }
        mutating set { component = newValue }
    }
}


class Resolver {
  
    static let shared = Resolver()
    
    private var assembler: Assembler

    init() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            self.assembler = Assembler([])
        } else {
            
            self.assembler = Assembler(
                [RepositoriesAssembly()]
            )
        }
    }

    func resolve<Component>(_ type: Component.Type) -> Component {
        guard let component = assembler.resolver.resolve(Component.self) else {
            fatalError("\(String(describing:Component.self)) not found in resolver.")
        }
        return component
    }
}

public class RepositoriesAssembly: Assembly {
    
    public init(){}
    
    public func assemble(container: Container) {
        assembleRepositories(in: container)
    }
    
    private func assembleRepositories(in container: Container) {
        
        container.autoregister(IAppUseCase.self, initializer: ManagerUserDefaultt.init)
        container.autoregister(IUserUseCase.self, initializer: DataBaseCourse.init)
        container.autoregister(IDataUseCase.self, initializer: Repository.init)
    }
    
}

