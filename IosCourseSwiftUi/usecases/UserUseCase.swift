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
   
    static func validateUser(user : String,pass : String,context : NSManagedObjectContext,completion: @escaping (Bool) -> Void){
        DataBaseCourse.validateLogin(context: context,user: user,pass: pass){ data ,error in
                             if error != nil{
                                 completion(false)
                             }else{
                                 completion(true)
                             }
                       }
     }
    
    static func registerUser(user : String,pass : String,context : NSManagedObjectContext,completion: @escaping (Bool) -> Void){
        DataBaseCourse.saveUserEntity(context: context,user: user,pass: pass){ success in
                              completion(success)
        }
     }
}
