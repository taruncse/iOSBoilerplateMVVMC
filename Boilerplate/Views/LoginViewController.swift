//
//  ViewController.swift
//  Boilerplate
//
//  Created by DreamOnline on 2/1/21.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded , UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet var userEmailTF: UITextField!
    @IBOutlet var userPasswordTF: UITextField!
    @IBOutlet var loinBtn : UIButton!
    @IBOutlet var loginStatusLbl: UILabel!
    
    fileprivate var isLoaded : Bool = false
    
    var viewModel : LoginViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        
        didSet {
            viewModel?.viewDelegate = self
            refreshView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loinBtn.isEnabled = false
        
        self.userEmailTF.delegate = self
        self.userPasswordTF.delegate = self
        self.userEmailTF.addTarget(self, action: #selector(userEmailChanged(_:)), for: UIControl.Event.editingChanged)
        self.userPasswordTF.addTarget(self, action: #selector(userPasswordChanged(_:)), for: UIControl.Event.editingChanged)
        isLoaded = true
        refreshView()
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
    
    @objc func userPasswordChanged(_ passwordTextField : UITextField) {
        if let password = passwordTextField.text {
            self.loginStatusLbl.text = ""
            self.viewModel?.password = password
        }
    }
    
    @objc func userEmailChanged(_ emailTextField : UITextField) {
        if let email = emailTextField.text {
            self.loginStatusLbl.text = ""
            self.viewModel?.email = email
        }
    }
    
    @IBAction func openTab(_ sender: Any) {
        //initTabBar()
        self.viewModel?.submit()
    }
    
    func refreshView() {
        if isLoaded {
        
        }else {
            
        }
    }
    
}

extension LoginViewController : LoginViewModelViewDelegate {
    func loginModelChanged(viewModel: LoginViewModel, canSumbit : Bool) {
        if canSumbit {
            self.loinBtn.isEnabled = true
        }else {
            self.loinBtn.isEnabled = false
        }
    }
    
    func loginStatus(viewModel: LoginViewModel, message: String, isSuccessFull : Bool) {
        if isSuccessFull {
            self.loginStatusLbl.textColor = .green
        } else {
            self.loginStatusLbl.textColor = .red
        }
        self.loginStatusLbl.text = message
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
