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
    @State var textValueR: String = "Tayler"
    
    let placeHolderPassR: String = "contraseña"
    @State var textValuePassR: String = "Tayler"
    
    //@StateObject var viewModel: RegisterViewModel = RegisterViewModel()
    //@Inject var viewModel: RegisterViewModel
    @EnvironmentObject var viewModel: RegisterViewModel
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 20) {
                ZStack(alignment: .leading) {
                            Text(placeHolderR)
                                .foregroundColor(Color(.placeholderText))
                                .offset(y: textValueR.isEmpty ? 0 : -25)
                                .scaleEffect(textValueR.isEmpty ? 1: 0.8, anchor: .leading)
                            TextField("", text: $textValueR)
                        }
                .padding(.top, textValueR.isEmpty ? 0 : 15)
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
                        
                ZStack(alignment: .leading) {
                            Text(placeHolderPassR)
                                .foregroundColor(Color(.placeholderText))
                                .offset(y: textValuePassR.isEmpty ? 0 : -25)
                                .scaleEffect(textValuePassR.isEmpty ? 1: 0.8, anchor: .leading)
                            TextField("", text: $textValuePassR)
                        }
                .padding(.top, textValuePassR.isEmpty ? 0 : 15)
                        .frame(height: 52)
                        .padding(.horizontal, 16)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1).foregroundColor(.gray))
                Button("Registrase") {
                    viewModel.registerUser(user: textValueR, pass: textValuePassR,context: managedObjectContext)
                }.padding(12).background(Color.blue) // If you have this
                    .cornerRadius(25).foregroundColor(.white)
                
            }.padding(20)
                .alert(viewModel.errorMesaggeR, isPresented: .constant(viewModel.showingAlertR)) {
                            Button("Aceptar", role: .cancel) {
                                if viewModel.appEventLogin == LoginEvent.Home {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
            
            
            
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
