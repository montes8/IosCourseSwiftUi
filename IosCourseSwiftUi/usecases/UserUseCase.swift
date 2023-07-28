//
//  UserUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import UIKit
import CoreData

class UserUseCase{
    
    let iUserUseCase : IUserUseCase = DataBaseCourse()
   
     func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
        return await iUserUseCase.validateLogin(context: context,user: user,pass: pass)
     }
    
     func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
         iUserUseCase.saveUserEntity(context: context,user: user,pass: pass)
     }
}
