//
//  IDataBaseCourse.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation
import CoreData

public protocol IDataBaseCourse {
    
    func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
    
    func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool
     
}
