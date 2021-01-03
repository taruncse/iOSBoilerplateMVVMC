//
//  LoginCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func didLoginFinished()
}

class LoginCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    var window: UIWindow
    
    var loginLoordinatorDelegate : LoginCoordinatorDelegate?
    
    init(navigationController : UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let loginVC = LoginViewController.instantiate()
        let loginViewModel = LoginVM()
        loginViewModel.dataModel = LoginModel()
        loginVC.viewModel = loginViewModel
        window.rootViewController = loginVC
        //self.navigationController.pushViewController(loginVC, animated: true)
    }
    
}
