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
                Text("FOOD MERIA").font(.system(size: 25,weight: .bold)).foregroundColor(.white)
                Text("BIENVENIDOS").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
                Text("HAS TU PEDIDO AHORA").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
              
                if splashViewModel != nil{
                    if splashViewModel.successToken ?? false{
                        DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                   }else{
                       DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                    }
                }
              
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
