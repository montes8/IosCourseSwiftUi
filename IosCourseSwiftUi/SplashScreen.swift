//
//  ContentView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 17/07/23.
//

import SwiftUI
import CoreData

struct SplashScreen: View {

    var body: some View {
        VStack(spacing: 16) {
            Text("FOOD MERIA").font(.system(size: 25,weight: .bold)).foregroundColor(.white)
            Text("BIENVENIDOS").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
            Text("HAS TU PEDIDO AHORA").font(.system(size: 20,weight: .bold)) .foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all).frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
            Image(uiImage: UIImage(named: "background_splash")!)
                .resizable()
                .edgesIgnoringSafeArea(.all)
        )
    }
       
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
