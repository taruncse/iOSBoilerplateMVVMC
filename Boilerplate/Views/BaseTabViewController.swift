//
//  BaseTabViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 3/1/21.
//

import UIKit

class BaseTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


class FirstViewController: BaseTabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "First"
    }
    
}

class SecondViewController: BaseTabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Second"
    }
}

class ThirdViewController: BaseTabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Third"
    }
}

class FourthViewController: BaseTabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Fourth"
    }
}

class FifthViewController: BaseTabViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Fifth"
    }
}
