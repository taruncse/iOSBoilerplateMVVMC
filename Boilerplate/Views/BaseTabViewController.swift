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
    var didSendEventClosure: ((FirstViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "First"
    }
    
    enum Event {
        case first
    }
}

class SecondViewController: BaseTabViewController {
    var didSendEventClosure: ((SecondViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Second"
    }
    
    enum Event {
        case second
    }
}

class ThirdViewController: BaseTabViewController {
    var didSendEventClosure: ((ThirdViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Third"
    }
    
    enum Event {
        case third
    }
}

class FourthViewController: BaseTabViewController {
    var didSendEventClosure: ((FourthViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Fourth"
    }
    
    enum Event {
        case fourth
    }
}

class FifthViewController: BaseTabViewController {
    var didSendEventClosure: ((FifthViewController.Event) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Fifth"
    }
    
    enum Event {
        case fifth
    }
}
