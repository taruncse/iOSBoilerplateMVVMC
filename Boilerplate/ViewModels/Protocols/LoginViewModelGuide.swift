//
//  LoginViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation

protocol LoginViewModelViewDelegate : class {
    func loginModelChanged (viewModel : LoginViewModelGuide, canSumbit : Bool)
    func loginStatus (viewModel : LoginViewModelGuide, message : String, isSuccessFull : Bool)

}
protocol LoginViewModelCoordinatorDelegate : class {
    func loginDidFinished (viewModel : LoginViewModelGuide)
}
protocol LoginViewModelGuide : class {
    var dataModel : LoginModelGuide? { set get }
    var data : LoginDataModelGuide? { set get }
    
    var viewDelegate : LoginViewModelViewDelegate? { set get }
    var coordinatorDelegate : LoginViewModelCoordinatorDelegate? { set get }
    
    var canSubmit : Bool { get }
    var errorMessage : String { get set }
    var email : String { get set }
    var password : String { get set }

    func submit()
    
}
