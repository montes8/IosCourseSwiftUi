//
//  ContentView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 17/07/23.
//

import SwiftUI
import CoreData

struct SplashScreen: View {
    
    @State var nextLogin : Bool = false
    
    @ObservedObject var splashViewModel = SplashViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Button(action:{ nextLogin = true}){
                    Text("FOOD MERIA").font(.system(size: 25,weight: .bold)).foregroundColor(.white)
                }.sheet(isPresented: $nextLogin, content: {
                    LoginScreen(title: "Hola login")
                })
                
                NavigationLink(destination: LoginScreen(title: "Hola login"),isActive: $nextLogin){
                    Text("BIENVENIDOS").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
                }
                
              
                Text("HAS TU PEDIDO AHORA").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
               // DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                //if splashViewModel != nil{
                //    if splashViewModel.successToken ?? false{
                //        DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                //   }else{
                //       DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                //    }
                // }
              
            }.edgesIgnoringSafeArea(.all).frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(
                    Image(uiImage: UIImage(named: "background_splash")!)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                )
        }
        
    }
   
        
       
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
