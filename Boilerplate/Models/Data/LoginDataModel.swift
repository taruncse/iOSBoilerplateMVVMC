//
//  LoginDataModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation

class LoginDataModel: LoginDataModelGuide {
    
    var email: String
    var password: String
    
    init(email : String , password : String) {
        self.email = email
        self.password = password
    }
}
