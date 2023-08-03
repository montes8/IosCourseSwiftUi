//
//  IRepository.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 2/08/23.
//

import Foundation
import Alamofire

public protocol IRepository {
    
    @Sendable func requestService<T: Decodable>( method: HTTPMethod,
                                               params: Parameters?,
                                               header: HTTPHeaders?,
                                               interceptor: RequestInterceptor?,
                                               type: T.Type) async throws -> (T?, String?)
}
