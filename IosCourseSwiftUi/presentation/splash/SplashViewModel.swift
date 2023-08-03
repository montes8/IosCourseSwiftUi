//
//  SplashViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation


final class  SplashViewModel :ObservableObject{
   
    @Published var successToken : Bool = false
    
    @Inject private var appUseCase: IAppUseCase
    
    @MainActor
    func getTokenTwo(){
        Task {
            self.successToken = appUseCase.getToke()
        }
    }
    
}
