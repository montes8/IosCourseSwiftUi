//
//  IManagerUserDefault.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation

public protocol IManagerUserDefault {
    
    @Sendable func getToke() -> Bool
    
    @Sendable func saveToken(token : Bool) -> Void
}
