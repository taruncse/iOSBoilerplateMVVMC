//
//  AppCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow
    
    
    fileprivate var isLogin : Bool {
        return false
    }
    
    init(navigationController : UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if isLogin {
           showTabbar()
        } else {
            showLogin()
        }
    }
}

extension AppCoordinator : LoginCoordinatorDelegate {
    func didLoginFinished() {
        
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, window: window)
        loginCoordinator.start()
    }
}

extension AppCoordinator {
    func showTabbar() {
        
    }
}
