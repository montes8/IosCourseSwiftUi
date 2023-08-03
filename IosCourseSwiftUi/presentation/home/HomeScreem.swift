//
//  HomeView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import SwiftUI

struct HomeScreem: View {
    
    //@StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
    
        NavigationView{
            VStack() {
                List(viewModel.listRecipe, id: \.id){model in
                        VStack() {
                                HStack{
                                        AsyncImage(url: URL(string: model.urlImg)).scaledToFill()
                                            .frame(width: 100,height: 100)
                                         .cornerRadius(10)
     
                                        VStack(alignment: .leading, spacing: 0){
                                            Text(model.title).font(.system(size: 20,weight: .bold)).lineLimit(1).foregroundColor(.black)
                                            Text(model.description).font(.system(size: 16,weight: .bold)).lineLimit(5).foregroundColor(.black)
                                        }
               
                                }.padding(8).background(Color.gray)
                                .cornerRadius(20)
                        }.padding(4).listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                   
                }.scrollIndicators(ScrollIndicatorVisibility.hidden).listStyle(PlainListStyle())
            }.alert(viewModel.errorMesagge, isPresented: .constant(viewModel.showingAlert)) {
                Button("Aceptar", role: .cancel) { }
            }
          
           }.navigationTitle("Home").navigationBarBackButtonHidden(true).onAppear{
            viewModel.loadListRecipes()
        }
        
    }
    
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreem()
    }
}
