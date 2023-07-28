//
//  AppUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

class AppUseCase {
    
    let managerUserDefaultt : IAppUseCase = ManagerUserDefaultt()
    

    func getToke() -> Bool{
        return  managerUserDefaultt.getToke()
    }
    
     func saveToken() -> Void{
         managerUserDefaultt.saveToken(token: true)
    }
    
}
