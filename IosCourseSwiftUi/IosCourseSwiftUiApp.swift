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
    
    @Inject var viewModel: LoginViewModel
    @Inject var splashViewModel: SplashViewModel
    @Inject var loginViewModel: LoginViewModel
    @Inject var registerViewModel: RegisterViewModel
    @Inject var homeViewModel: HomeViewModel

    var body: some Scene {
        WindowGroup {
            SplashScreen().environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
                .environmentObject(splashViewModel)
                .environmentObject(splashViewModel)
                .environmentObject(loginViewModel)
                .environmentObject(registerViewModel)
                .environmentObject(homeViewModel)
        }
    }
    
}


