//
//  AppUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

class AppUseCase {
    
    @Inject private var managerUserDefaultt: IAppUseCase
    
    func getToke() -> Bool{
        return  managerUserDefaultt.getToke()
    }
    
     func saveToken() -> Void{
         managerUserDefaultt.saveToken(token: true)
    }
    
}
