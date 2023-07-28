//
//  HomeView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import SwiftUI

struct HomeScreem: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    @State private var hue: CGFloat = 100
    
    var body: some View {
    
        NavigationView{
            VStack() {
                List(){
                    ForEach(viewModel.listRecipe, id: \.id){model in
                        VStack() {
                            Spacer()
                                HStack{
                                        AsyncImage(url: URL(string: model.urlImg)).scaledToFill()
                                            .frame(width: 100,height: hue)
                                         .cornerRadius(10)
     
                                        VStack(alignment: .leading, spacing: 0){
                                            Text(model.title).font(.system(size: 20,weight: .bold)).lineLimit(1).foregroundColor(.black)
                                            Text(model.description).font(.system(size: 16,weight: .bold)).lineLimit(5).foregroundColor(.black)
                                        }.background(Color.red)
               
                                }.padding(8).background(Color.blue).cornerRadius(20)
                        }.padding(4).listRowSeparator(.hidden)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                   
                }.scrollIndicators(ScrollIndicatorVisibility.hidden).listStyle(PlainListStyle())
            }.alert(viewModel.errorMesagge, isPresented: $viewModel.showingAlert) {
                Button("Aceptar", role: .cancel) { }
            }
          
        }.navigationTitle("Home").navigationBarBackButtonHidden(true).onAppear{
            viewModel.loadListRecipes()
        }
        
    }
    
    @ViewBuilder
    func placeholderImage() -> some View {
        Image(systemName: "photo")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50,height: .infinity)
            .foregroundColor(.gray)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreem()
    }
}
