//
//  LoginCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func didLoginFinished(email : String)
}

class LoginCoordinator: Coordinator {
    
    var delegate : LoginCoordinatorDelegate?
    
    var childCoordinators = [String : Coordinator]()

    var navigationController: UINavigationController
    var window: UIWindow
    
    var loginLoordinatorDelegate : LoginCoordinatorDelegate?
    
    init(navigationController : UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let loginVC = LoginViewController.instantiate()
        let loginViewModel = LoginViewModel()
        loginViewModel.dataModel = LoginModel()
        loginViewModel.coordinatorDelegate = self
        loginVC.viewModel = loginViewModel
        window.rootViewController = loginVC
        //self.navigationController.pushViewController(loginVC, animated: true)
    }
}

extension LoginCoordinator : LoginViewModelCoordinatorDelegate {
    func loginDidFinished(viewModel: LoginViewModelGuide?) {
        if let viewModel = viewModel {
            self.delegate?.didLoginFinished(email: viewModel.email)
        }
    }
}
