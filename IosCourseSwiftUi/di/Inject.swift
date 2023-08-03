//
//  Inject.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 31/07/23.
//

import Foundation

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
