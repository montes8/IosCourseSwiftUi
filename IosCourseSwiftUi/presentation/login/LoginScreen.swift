//
//  LoginScreen.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 18/07/23.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    let placeHolder: String = "usuario"
    @State var textValue: String = "2345678"
    
    let placeHolderPass: String = "contraseña"
    @State var textValuePass: String = "**************"
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 20) {
                TextInputLayout(hint: placeHolder, textValue: $textValue)
                TextInputLayout(hint: placeHolderPass, textValue: $textValuePass)
                Button("Iniciar Sesiòn") {
                    presentationMode.wrappedValue.dismiss()
                  //  viewModel.validateUser(user: textValue, pass: textValuePass,context: managedObjectContext)
                }
                
            }.padding(20)
                .alert(isPresented: $viewModel.showingAlert, content: {
                            Alert(title: Text("Aplicación Prueba"),
                                  message: Text("Ocurrio un error desconocido"),
                                  primaryButton: Alert.Button.default(Text("Aceptar"), action: {
                                    print("El user ha pulsado el botón de Aceptar")
                                  }),
                                  secondaryButton: .destructive(Text("Cancelar")))
                        })
            
            if viewModel.appEventLogin == LoginEvent.Home {
                DelayedNavigationLink(delay: .seconds(0)) {HomeScreem()}
            }else if viewModel.appEventLogin == LoginEvent.Register {
                DelayedNavigationLink(delay: .seconds(0)) {HomeScreem()}
            }
           
            
        }.navigationTitle("Hola login").navigationBarBackButtonHidden(true)
        
    }
    
  
      
}

func TextInputLayout(hint : String,textValue: Binding<String>) -> some View{
    return ZStack(alignment: .leading) {
                Text(hint)
                    .foregroundColor(Color(.placeholderText))
                    .offset(y: textValue.wrappedValue.isEmpty ? 0 : -25)
                    .scaleEffect(textValue.wrappedValue.isEmpty ? 1: 0.8, anchor: .leading)
                TextField("", text: textValue)
            }
    .padding(.top, textValue.wrappedValue.isEmpty ? 0 : 15)
            .frame(height: 52)
            .padding(.horizontal, 16)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
            .animation(.default)
}
                  

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
         LoginScreen()
    }
}
