//
//  IosCourseSwiftUiApp.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 17/07/23.
//

import SwiftUI

@main
struct IosCourseSwiftUiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
