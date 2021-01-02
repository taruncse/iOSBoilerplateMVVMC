//
//  Coordinator.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { set get }
    var navigationController : UINavigationController { set get }
    func start()
}
