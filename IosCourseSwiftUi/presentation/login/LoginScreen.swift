//
//  LoginScreen.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 18/07/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
        
    let placeHolder: String = "usuario"
    @State var textValue: String = "Tayler"
    
    let placeHolderPass: String = "contraseña"
    @State var textValuePass: String = "Tayler"
    
    @ObservedObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 20) {
                
                ZStack(alignment: .leading) {
                            Text(placeHolder)
                                .foregroundColor(Color(.placeholderText))
                                .offset(y: textValue.isEmpty ? 0 : -25)
                                .scaleEffect(textValue.isEmpty ? 1: 0.8, anchor: .leading)
                            TextField("", text: $textValue)
                        }
                .padding(.top, textValue.isEmpty ? 0 : 15)
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
                        
                
                ZStack(alignment: .leading) {
                            Text(placeHolderPass)
                                .foregroundColor(Color(.placeholderText))
                                .offset(y: textValuePass.isEmpty ? 0 : -25)
                                .scaleEffect(textValuePass.isEmpty ? 1: 0.8, anchor: .leading)
                            TextField("", text: $textValuePass)
                        }
                .padding(.top, textValue.isEmpty ? 0 : 15)
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
                        
                
                Button("Iniciar Sesiòn") {
                    viewModel.validateUser(user: textValue, pass: textValuePass,context: managedObjectContext)
                }.padding(12).background(Color.blue) // If you have this
                    .cornerRadius(25).foregroundColor(.white)
                
                Button("Crear Cuenta") {
                    viewModel.nextRegister()
                }
                .cornerRadius(25).foregroundColor(.blue)
                if viewModel.appEventLogin == LoginEvent.Register {
                              DelayedNavigationLink(delay: .seconds(0)) {RegisterScreem()}
                    
                          }else if viewModel.appEventLogin == LoginEvent.Home {
                             
                              DelayedNavigationLink(delay: .seconds(0)) {HomeScreem()}
                            
                          }
                
            }.padding(20)
                .alert(viewModel.errorMesagge, isPresented: $viewModel.showingAlert) {
                    Button("Aceptar", role: .cancel) {
                    }
                }
            
          
                     
        }.navigationTitle("").navigationBarBackButtonHidden(true)
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
         LoginScreen()
    }
}
