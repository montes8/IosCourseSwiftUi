//
//  RegisterScreem.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 23/07/23.
//

import SwiftUI

struct RegisterScreem: View {
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var managedObjectContext
    let placeHolderR: String = "usuario"
    @State var textValueR: String = ""
    
    let placeHolderPassR: String = "contraseña"
    @State var textValuePassR: String = ""
    
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 20) {
                TextInputLayout(hint: placeHolderR, textValue: $textValueR)
                TextInputLayout(hint: placeHolderPassR, textValue: $textValuePassR)
                Button("Registrase") {
                    presentationMode.wrappedValue.dismiss()
                   // viewModel.registerUser(user: textValueR, pass: textValuePassR,context: managedObjectContext)
                }.padding(12).background(Color.blue) // If you have this
                    .cornerRadius(25).foregroundColor(.white)
                
            }.padding(20)
                .alert(isPresented: $viewModel.showingAlertR, content: {
                            Alert(title: Text("Aplicación Prueba"),
                                  message: Text("Ocurrio un error desconocido"),
                                  primaryButton: Alert.Button.default(Text("Aceptar"), action: {
                                    print("El user ha pulsado el botón de Aceptar")
                                  }),
                                  secondaryButton: .destructive(Text("Cancelar")))
                        })
            
            
            
        }.navigationTitle("Registro").navigationBarBackButtonHidden(true).onAppear{
            if viewModel.appEventLogin == LoginEvent.Home {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct RegisterScreem_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreem()
    }
}
