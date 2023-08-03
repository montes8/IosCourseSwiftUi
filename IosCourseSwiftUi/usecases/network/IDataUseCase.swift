//
//  IDataUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 28/07/23.
//

import Foundation
import Alamofire


protocol IDataUseCase {
    
    @Sendable func getList() async throws -> ([RecipesModel]?, String?)
}
