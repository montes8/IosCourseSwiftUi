//
//  SplashViewModel.swift
//  IosCourseSwiftUi
//
//  Created by MacBook Pro on 19/07/23.
//

import Foundation


class  SplashViewModel :ObservableObject{
    

    
    @Published var successToken : Bool = false
    
    init() {
        getTokenTwo()
    }
   
    

    
    func getTokenTwo(){
            self.successToken = AppUseCase.getToke()
            self.successToken = false
    }
    
}
