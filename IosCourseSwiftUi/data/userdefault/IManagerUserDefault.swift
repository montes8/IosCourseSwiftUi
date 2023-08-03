//
//  IManagerUserDefault.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation

public protocol IManagerUserDefault {
    
     func getToke() -> Bool
    
     func saveToken(token : Bool) -> Void
}
