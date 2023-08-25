//
//  ViewModelModule.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 3/08/23.
//

import Foundation
import Swinject


public class ViewModelModule: Assembly {
    
    public init(){}
    
    public func assemble(container: Container) {
        
        container.autoregister(SplashViewModel.self, initializer: SplashViewModel.init).inObjectScope(.container)
        container.autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
            .inObjectScope(.container)
        container.autoregister(RegisterViewModel.self, initializer: RegisterViewModel.init)
            .inObjectScope(.container)
        container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
            .inObjectScope(.container)
    }
}
