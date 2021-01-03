//
//  LoginModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation
// TODO add Login logic or API call here
class LoginModel: LoginModelGuide{
    func isUserValid(user: LoginDataGuide, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            completion(true)
        }
    }
}
