//
//  HomeViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 27/07/23.
//

import Foundation

class HomeViewModel : ObservableObject{
    
    @Published var showingAlert: Bool = false
    @Published var errorMesagge: String = "Ocurrio un error"
    @Published var listRecipe: [RecipesModel] = []
    

    @Inject private var dataUseCase: IDataUseCase
    

    @MainActor // MainActor es un singleton que ejecuta código en el hilo principal.
    func loadListRecipes() {
        
        guard listRecipe.isEmpty else {
            return
        }
        
        Task {
            do {
                let response = try await dataUseCase.getList()
                if response.0 != nil{
                    print(response)
                    self.listRecipe = response.0 ?? []
                }else{
                    print("error al consultar servicio")
                    self.showingAlert = true
                    self.errorMesagge = "Usuario no registrado"
                }
            
            } catch {
                showingAlert = true
                print("error al consultar servicio")
                self.errorMesagge = "Ocurrio un error en la petición"
            }
    
        }
    }
}
