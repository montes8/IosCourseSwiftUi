//
//  DataUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 27/07/23.
//

import Foundation

class DataUseCase {
    
    let iDataUseCase : IDataUseCase = Repository()
    
    func getList()async throws -> ([RecipesModel]?, String?){
        
        var response = try await iDataUseCase.requestService(method: .get,params: nil,
                                                header: nil,interceptor: nil,type: [RecipesResponse].self)
        return (RecipesResponse.loadListRecipe(response: response.0 ?? []),response.1)
    }
}
