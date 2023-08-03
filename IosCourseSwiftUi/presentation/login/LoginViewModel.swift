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
    
    @Inject private var userUseCase: IUserUseCase
    
   
    @Published var appEventLogin: LoginEvent = .Default {
        didSet {
            objectWillChange.send()
        }
    }
    
    func nextRegister(){
        self.appEventLogin = LoginEvent.Register
    }
    
    
    @MainActor // MainActor es un singleton que ejecuta código en el hilo principal.
    func validateUser(user : String,pass : String,context : NSManagedObjectContext) {
        print("logindata "+user + "  " + pass)
        Task {
            do {
                let response = await userUseCase.validateUser(user: user, pass: pass, context: context)
                if response{
                    self.appEventLogin = LoginEvent.Home
                }else{
                    self.appEventLogin = LoginEvent.Error
                    self.showingAlert = true
                    self.errorMesagge = "Usuario no registrado"
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
    case Default
}
