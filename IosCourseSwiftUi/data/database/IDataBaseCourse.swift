//
//  IDataBaseCourse.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation
import CoreData

public protocol IDataBaseCourse {
    
    @Sendable func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
    
    @Sendable func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
     
}
