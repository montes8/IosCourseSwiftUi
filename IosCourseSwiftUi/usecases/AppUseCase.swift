//
//  AppUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

class AppUseCase : IAppUseCase{
    
    @Inject private var managerUserDefaultt: IManagerUserDefault
    
    func saveToken() {
        managerUserDefaultt.saveToken(token: true)
    }
    
    func getToke() -> Bool{
        return  managerUserDefaultt.getToke()
    }
    
}
