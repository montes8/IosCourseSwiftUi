//
//  ManagerUserDefaultt.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

internal class ManagerUserDefaultt : IManagerUserDefault{
    
    func getToke() -> Bool {
        return UserDefaults.standard.bool(forKey: "token")
    }
    
    func saveToken(token : Bool) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
}
