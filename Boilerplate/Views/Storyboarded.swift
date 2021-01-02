//
//  Storyboarded.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import Foundation
import UIKit

protocol Storyboarded {
   static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboardName = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboardName.instantiateViewController(identifier: className) as! Self
        return viewController
    }
}
