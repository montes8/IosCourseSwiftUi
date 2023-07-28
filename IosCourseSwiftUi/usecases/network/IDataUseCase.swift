//
//  IDataUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 28/07/23.
//

import Foundation
import Alamofire


public protocol IDataUseCase {
    
    func requestService<T: Decodable>( method: HTTPMethod,
                                               params: Parameters?,
                                               header: HTTPHeaders?,
                                               interceptor: RequestInterceptor?,
                                               type: T.Type) async throws -> (T?, String?) 
}
