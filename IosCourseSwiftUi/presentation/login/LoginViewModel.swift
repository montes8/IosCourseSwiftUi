//
//  LoginViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import Foundation
import Combine
import CoreData
import UIKit

class LoginViewModel : ObservableObject{
    
    @Published var showingAlert: Bool = false
    @Published var errorMesagge: String = "Ocurrio un error"
    
   
    @Published var appEventLogin: LoginEvent = .Register {
        didSet {
            objectWillChange.send()
        }
    }
    
    
    @MainActor // MainActor es un singleton que ejecuta código en el hilo principal.
    func validateUser(user : String,pass : String,context : NSManagedObjectContext) {
        print("logindata "+user + "  " + pass)
        Task {
            do {
                UserUseCase.validateUser(user: user, pass: pass, context: context) { success in
                    
                     if success{
                         self.appEventLogin = LoginEvent.Home
                         
                     }else{
                         self.appEventLogin = LoginEvent.Error
                         self.showingAlert = true
                         self.errorMesagge = "Usuario no registrado"
                         
                     }
                }
            
            } catch {
                appEventLogin = .Error
                showingAlert = true
                self.errorMesagge = "Ocurrio un error en la petición"
            }
    
        }
    }
   

}


enum LoginEvent {
    case Home
    case Register
    case Error
}