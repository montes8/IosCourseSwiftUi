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
    //var appUseCase : IAppUseCase
    
    //init() {
    //    container.register(IAppUseCase.self) { r in AppUseCase()}
    //    appUseCase  = container.resolve(IAppUseCase.self)!
    //}
   

   
    
    @MainActor
    func getTokenTwo(){
        //guard let appUseCase  = container.resolve(IAppUseCase.self) else {return}
        Task {
            self.successToken = appUseCase.getToke()
        }
    }
    
}
