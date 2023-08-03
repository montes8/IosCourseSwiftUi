//
//  UserUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import UIKit
import CoreData

class UserUseCase : IUserUseCase {
    
    @Inject private var iDataBaseCourse: IDataBaseCourse
   
     func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
        return await iDataBaseCourse.validateUser(user: user,pass: pass,context: context)
     }
    
     func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
         return await iDataBaseCourse.registerUser(user: user,pass: pass,context: context)
     }
}
