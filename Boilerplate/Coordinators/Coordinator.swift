//
//  Coordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [String : Coordinator] { set get }
    var navigationController : UINavigationController { set get }
    var window : UIWindow { set get }
    func start()
}
