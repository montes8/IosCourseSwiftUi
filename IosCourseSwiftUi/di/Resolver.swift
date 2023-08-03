//
//  Resolver.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 31/07/23.
//

import Foundation
import Swinject

class Resolver {
  
    static let shared = Resolver()
    
    private var assembler: Assembler

    init() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            self.assembler = Assembler([])
        } else {
            
            self.assembler = Assembler(
                [RepositoriesModule(),UseCaseModule(),ViewModelModule()]
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
