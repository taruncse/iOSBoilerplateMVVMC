//
//  LoginUserVM.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation

class LoginViewModel: LoginViewModelGuide {
    
    var dataModel: LoginModelGuide?
    
    var data: LoginDataModelGuide?
    
    weak var viewDelegate: LoginViewModelViewDelegate?
    
    weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    
    fileprivate var emailIsValidFormat : Bool = false
    fileprivate var passwordIsValidFormat : Bool = false
    
    var canSubmit : Bool {
        return emailIsValidFormat && passwordIsValidFormat
    }
    
    var errorMessage: String = "" {
        didSet {
            
        }
    }
    
    var email: String = "" {
        didSet {
            if oldValue != email {
                let oldCanSumbit = canSubmit
                emailIsValidFormat = Common.isValidateEmailFormat(email)
                if canSubmit != oldCanSumbit {
                    viewDelegate?.loginModelChanged(viewModel: self, canSumbit: canSubmit)
                }
            }
        }
    }
    
    var password: String = "" {
        didSet {
            if oldValue != password {
                let oldCanSumbit = canSubmit
                passwordIsValidFormat = Common.isValidatePasswordFormat(password)
                if canSubmit != oldCanSumbit {
                    viewDelegate?.loginModelChanged(viewModel: self, canSumbit: canSubmit)
                }
            }
        }
    }
    
    func submit() {
        data = LoginDataModel(email: email, password: password)
        
        guard let userData = data, canSubmit else {
            return
        }
        
        dataModel?.isUserValid(user: userData, completion: {(isLogedIn) in
            DispatchQueue.main.async {
                var loginMessage = "Invalid Email or Password"
                if isLogedIn {
                    loginMessage = "LoggedIn Successfuly"
                    self.coordinatorDelegate?.loginDidFinished(viewModel: self)
                }
                self.viewDelegate?.loginStatus(viewModel: self, message: loginMessage, isSuccessFull: isLogedIn)
            }
        })
    }
}
