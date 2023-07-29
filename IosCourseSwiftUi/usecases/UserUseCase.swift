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
    
    @Inject private var iUserUseCase: IUserUseCase
   
     func validateUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
        return await iUserUseCase.validateUser(user: user,pass: pass,context: context)
     }
    
     func registerUser(user : String,pass : String,context : NSManagedObjectContext) async -> Bool{
         return await iUserUseCase.registerUser(user: user,pass: pass,context: context)
     }
}
