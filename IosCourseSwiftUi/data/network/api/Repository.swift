//
//  Repository.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 27/07/23.
//

import Foundation
import Alamofire

internal class Repository : IRepository{
   
    
    func requestService<T: Decodable>( method: HTTPMethod,
                                               params: Parameters?,
                                               header: HTTPHeaders?,
                                               interceptor: RequestInterceptor?,
                                               type: T.Type) async throws -> (T?, String?)  {

       let urlService = "https://5ebc-2800-200-e3c0-1123-b050-1996-fce-539f.ngrok-free.app/api/user/loadRecipes"
        
        return try await withCheckedThrowingContinuation { continuation in
            
            AF.request(urlService, method: method, parameters: params, encoding:
                        URLEncoding.default, headers: header, interceptor: interceptor).response{ response in
                
                switch response.result {
                case .success(let data):
                    do{
                        let responseService = try JSONDecoder().decode(type.self, from: data ?? Data())
                        continuation.resume(returning: (responseService, nil))
             
                    }catch{
                        continuation.resume(returning: (nil, "Error al decodificar"))
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    continuation.resume(returning: (nil, "Error al obtener datos"))
                }
               }
            
             }
     
       }
}
