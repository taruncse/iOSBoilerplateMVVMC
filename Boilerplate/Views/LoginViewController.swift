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
    
    var viewModel : LoginViewModelGuide? {
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
        self.viewModel?.submit()
    }
    
    func refreshView() {
        if isLoaded {
        
        }else {
            
        }
    }
    
}

extension LoginViewController : LoginViewModelViewDelegate {
    func loginModelChanged(viewModel: LoginViewModelGuide, canSumbit : Bool) {
        if canSumbit {
            self.loinBtn.isEnabled = true
        }else {
            self.loinBtn.isEnabled = false
        }
    }
    
    func loginStatus(viewModel: LoginViewModelGuide?, message: String, isSuccessFull : Bool) {
        if isSuccessFull {
            self.loginStatusLbl.textColor = .green
        } else {
            self.loginStatusLbl.textColor = .red
        }
        self.loginStatusLbl.text = message
    }

}
