//
//  ViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func openTab(_ sender: Any) {
        initTabBar()
    }
    func initTabBar() {
        let tabBar = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.title = "First"
        let vc2 = UINavigationController(rootViewController:SecondViewController())
        vc2.title = "Second"
        let vc3 = UINavigationController(rootViewController:ThirdViewController())
        vc3.title = "Third"
        let vc4 = UINavigationController(rootViewController:FourthViewController())
        vc4.title = "Fourth"
        let vc5 = UINavigationController(rootViewController:FifthViewController())
        vc5.title = "Fifth"
        
        tabBar.setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: true)

        guard let items = tabBar.tabBar.items else {
            return
        }
        
        let images = ["house", "bell", "person.circle" , "star", "gear"]
        
        for (index,item) in items.enumerated(){
            item.image = UIImage(systemName: images[index])
        }

        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar,animated: true)
    }
}

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "First"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Second"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Third"
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Fourth"
    }
}

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Fifth"
    }
}
