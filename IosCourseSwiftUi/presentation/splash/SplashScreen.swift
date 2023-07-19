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
                onNextScreem(splashViewModel:splashViewModel)
            }.edgesIgnoringSafeArea(.all).frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(
                    Image(uiImage: UIImage(named: "background_splash")!)
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                )
        }
        
    }
    

        func onNextScreem(splashViewModel : SplashViewModel) -> some View {
             if splashViewModel.successToken{
                 return  DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
               }else{
                   return  DelayedNavigationLink(delay: .seconds(3)) {LoginScreen()}
                }
        
        }
   
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
