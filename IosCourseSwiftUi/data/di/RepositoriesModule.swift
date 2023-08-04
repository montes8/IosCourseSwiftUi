//
//  RepositoriesModule.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 31/07/23.
//

import Foundation
import Swinject

public class RepositoriesModule: Assembly {
    
    
    public func assemble(container: Container) {
        assembleRepositories(in: container)
    }
    
    private func assembleRepositories(in container: Container) {
        container.autoregister(IManagerUserDefault.self, initializer: ManagerUserDefaultt.init)
        container.autoregister(IDataBaseCourse.self, initializer: DataBaseCourse.init)
        container.autoregister(IRepository.self, initializer: Repository.init)
    }
    
}
