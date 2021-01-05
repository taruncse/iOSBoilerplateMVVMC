//
//  LoginModelGuide.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation

protocol LoginModelGuide {
    func isUserValid(user:LoginDataModelGuide, completion: @escaping(_ isValid: Bool) -> Void)
}
