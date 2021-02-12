//
//  ViewController.swift
//  vkApp
//
//  Created by MacBook on 12.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var loginTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logInButton(_ sender: UIButton) {
        print("Login: \(loginTextField.text ?? "")")
        print("Password: \(passwordTextField.text ?? "")")
    }
    
}

