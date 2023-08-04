//
//  UseCaseModule.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation
import Swinject


public class UseCaseModule: Assembly {
  
    public func assemble(container: Container) {
        assembleUseCase(in: container)
    }
  
    
    
    private func assembleUseCase(in container: Container) {
        container.autoregister(IAppUseCase.self, initializer: AppUseCase.init)
        container.autoregister(IUserUseCase.self, initializer: UserUseCase.init)
        container.autoregister(IDataUseCase.self, initializer: DataUseCase.init)
    }
    
}
