//
//  DataUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 27/07/23.
//

import Foundation

internal class DataUseCase : IDataUseCase{
   
    @Inject private var iRepository: IRepository
    
    func getList()async throws -> ([RecipesModel]?, String?){
        
        let response = try await iRepository.requestService(method: .get,params: nil,
                                                header: nil,interceptor: nil,type: [RecipesResponse].self)
        return (RecipesResponse.loadListRecipe(response: response.0 ?? []),response.1)
    }
}
