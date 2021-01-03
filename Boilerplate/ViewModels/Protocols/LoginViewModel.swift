//
//  LoginViewModel.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation

protocol LoginViewModelViewDelegate {
    func loginModelChanged (viewModel : LoginViewModel, canSumbit : Bool)
    func loginStatus (viewModel : LoginViewModel, message : String, isSuccessFull : Bool)

}
protocol LoginViewModelCoordinatorDelegate {
    func loginDidFinished (viewModel : LoginViewModel)
}
protocol LoginViewModel {
    var dataModel : LoginModelGuide? { set get }
    var data : LoginDataGuide? { set get }
    
    var viewDelegate : LoginViewModelViewDelegate? { set get }
    var coordinatorDelegate : LoginViewModelCoordinatorDelegate? { set get }
    
    var canSubmit : Bool { get }
    var errorMessage : String { get set }
    var email : String { get set }
    var password : String { get set }

    func submit()
    
}
