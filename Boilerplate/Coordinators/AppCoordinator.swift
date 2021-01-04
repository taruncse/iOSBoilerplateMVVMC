//
//  AppCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [String : Coordinator]()
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
        childCoordinators.removeValue(forKey: Common.KEY_LOGIN_COORDINATOR)
       showTabbar()
    }
    
    func showLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController, window: window)
        loginCoordinator.delegate = self
        childCoordinators[Common.KEY_APP_COORDINATOR] = loginCoordinator
        loginCoordinator.start()
    }
}

extension AppCoordinator: TabCoordinatorDelegate {
    func didTabbarFinished() {
        childCoordinators.removeValue(forKey: Common.KEY_TAB_COORDINATOR)
    }
    
    func showTabbar() {
        let tabbarCoordinator = TabCoordinator(window, navigationController)
        tabbarCoordinator.delegate = self
        childCoordinators[Common.KEY_TAB_COORDINATOR] = tabbarCoordinator
        tabbarCoordinator.start()
    }
}
