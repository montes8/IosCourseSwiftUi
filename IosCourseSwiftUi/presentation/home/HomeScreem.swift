//
//  HomeView.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import SwiftUI

struct HomeScreem: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
    
        NavigationView{
            VStack() {
                List(viewModel.listRecipe, id: \.id){ model in
                    Section{
                        HStack() {
                            AsyncImage(url: URL(string: model.urlImg)){image in
                                image.resizable()
                            }placeholder: {
                                placeholderImage()
                            }.frame(width: 100)
                            
                            VStack(alignment: .leading, spacing: 0){
                                Text(model.title).font(.system(size: 20,weight: .bold)).lineLimit(1).foregroundColor(.black)
                                Text(model.description).font(.system(size: 16,weight: .bold)).lineLimit(5).foregroundColor(.black)
                            }.background(Color.red).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        }.frame(height: 150).padding(16)
                    }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .background(Color.blue)
                   
                }.scrollIndicators(ScrollIndicatorVisibility.hidden).listStyle(InsetGroupedListStyle())
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
            .frame(width: 50)
            .foregroundColor(.gray)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreem()
    }
}
