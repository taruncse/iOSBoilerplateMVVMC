//
//  LoginCoordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    var window: UIWindow
    
    init(navigationController : UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let loginVC = LoginViewController.instantiate()
        window.rootViewController = loginVC
        //self.navigationController.pushViewController(loginVC, animated: true)
    }
    
}
