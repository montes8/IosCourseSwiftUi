//
//  DataBaseCourse.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import CoreData


internal class DataBaseCourse : IUserUseCase{
    func validateUser(user: String, pass: String, context: NSManagedObjectContext) async -> Bool {
        let fetchRequest : NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
       let query = [NSPredicate(format: "name == %@", user),NSPredicate(format: "password == %@", pass)]

       do {
           if !query.isEmpty {fetchRequest.predicate = NSCompoundPredicate(type:.and, subpredicates:query)}
               let data = try context.fetch(fetchRequest)
               
              if data.isEmpty{
                  //completion(nil,"El usuario no esta registrado")
                  print("El usuario no esta registrado")
                  return false
               }else{
                  // completion(data,nil)
                   return true
               }
              
           }catch {
               print(error.localizedDescription)
              // completion(nil,"Ocurrio un error intentalo mas tarde")
               return false
               print("Ocurrio un error intentalo mas tarde")
           
           }
    }
    
    func registerUser(user: String, pass: String, context: NSManagedObjectContext) async -> Bool {
        let userEntity = UserEntity(context: context)
        userEntity.id = Int16.random(in: 10...20)
        userEntity.name = user
        userEntity.password = pass
        do {
            try context.save()
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
    
}
