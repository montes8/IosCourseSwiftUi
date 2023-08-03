//
//  IUserUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 28/07/23.
//

import Foundation
import CoreData

public protocol IUserUseCase {
    
    @Sendable func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
    
    @Sendable func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
     
}
