//
//  AppUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

class AppUseCase {
    
    static func getToke() -> Bool{
        return ManagerUserDefaultt.getToken()
    }
    
    static func saveToken(){
        ManagerUserDefaultt.saveToken(token: true)
    }
    
}
