//
//  ManagerUserDefaultt.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation

class ManagerUserDefaultt {
    
    static func getToken() -> Bool {
        return UserDefaults.standard.bool(forKey: "toke")
    }
    
    static func saveToken(token: Bool) {
        UserDefaults.standard.set(token, forKey: "token")
    }
    
}
