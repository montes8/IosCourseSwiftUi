//
//  LoginScreen.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 18/07/23.
//

import SwiftUI

struct LoginScreen: View {
        
    let placeHolder: String = "usuario"
    @State var textValue: String = "2345678"
    
    let placeHolderPass: String = "contraseña"
    @State var textValuePass: String = "**************"
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 20) {
                TextInputLayout(hint: placeHolder, textValue: $textValue)
                TextInputLayout(hint: placeHolderPass, textValue: $textValuePass)
                
            }.padding(20)
            
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
       
        //binding
                    // LoginScreen(placeHolder : "usuario",textValue: .constant("4565"),
                    //placeHolderPass : "contraseña",textValuePass: .constant("fgf")
         LoginScreen()
    }
}
