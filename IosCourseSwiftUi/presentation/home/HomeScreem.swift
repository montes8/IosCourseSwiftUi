//
//  HomeView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import SwiftUI

struct HomeScreem: View {
    var body: some View {
        NavigationView{
            Text("Hola soy el home")
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreem()
    }
}
