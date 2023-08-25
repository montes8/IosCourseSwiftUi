//
//  SplashViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation
import Swinject


final class  SplashViewModel : ObservableObject{
   
    @Published var successToken : Bool = false
    
    var container : Container = Container()
    @Inject private var appUseCase: IAppUseCase
  
    @MainActor
    func getTokenTwo(){
        Task {
            self.successToken = appUseCase.getToke()
        }
    }
}
