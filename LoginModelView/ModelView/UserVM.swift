//
//  UserVM.swift
//  LoginModelView
//
//  Created by Habib Durodola on 2020-08-03.
//  Copyright © 2020 DOH. All rights reserved.
//

import Foundation

class UserVM {

    var userName  = ""
    var password  = ""

    typealias validationCallBack = ( _ status : Bool , _ message : String ) -> Void

    var authCallback : validationCallBack?


    init(_ userName: String , password: String) {
        self.userName  = userName
        self.password = password
    }


    func validateInput (userName: String , password : String){

        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 0.3) {
            if (userName.count == 0 || password.count == 0){
                // return string and status
                print("This can not be empty")
                self.authCallback?(false , "This can not be empty")
            }
            else {
                // this is successful
                print("this is successful")
                self.authCallback?(true , "Login Successfully")
            }
        }

    }


    //MARK: COMPLETION HANDLER
    func loginCompletionHandler(callback : @escaping validationCallBack){
        self.authCallback = callback ;
    }
    
}
