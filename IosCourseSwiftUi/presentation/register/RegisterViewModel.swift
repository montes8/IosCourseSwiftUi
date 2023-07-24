//
//  RegisterViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 24/07/23.
//

import Foundation
import CoreData

class RegisterViewModel : ObservableObject{
    
    @Published var showingAlertR: Bool = false
    @Published var errorMesaggeR: String = "Ocurrio un error"
    
   
    @Published var appEventLogin: LoginEvent = .Register {
        didSet {
            objectWillChange.send()
        }
    }
    

    
    func registerUser(user : String,pass : String,context : NSManagedObjectContext) {
        print("logindata "+user + "  " + pass)
        Task {
            do {
                UserUseCase.registerUser(user: user, pass: pass, context: context) { success in
                     if success{
                         self.appEventLogin = LoginEvent.Home
                         
                     }else{
                         self.appEventLogin = LoginEvent.Error
                         self.showingAlertR = true
                         self.errorMesaggeR = "Usuario no registrado"
                     }
                }
            
            } catch {
                appEventLogin = .Error
                showingAlertR = true
                self.errorMesaggeR = "Ocurrio un error en la petición"
            }
    
        }
    }
}
