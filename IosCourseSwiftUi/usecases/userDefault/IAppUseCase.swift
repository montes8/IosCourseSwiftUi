//
//  IAppUseCase.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 28/07/23.
//

import Foundation

public protocol IAppUseCase {
    
    @Sendable func getToke() -> Bool
    
    @Sendable func saveToken()
}

