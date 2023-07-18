//
//  LoginScreen.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 18/07/23.
//

import SwiftUI

struct LoginScreen: View {
    var title : String = ""
    var body: some View {
        NavigationView{
            Text(title)
        }.navigationTitle("Hola login").navigationBarBackButtonHidden(true)
      
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
