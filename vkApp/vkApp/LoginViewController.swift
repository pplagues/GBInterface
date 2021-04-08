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
   @IBOutlet var scrollView: UIScrollView!
   @IBOutlet var bodyView: UIView!
   @IBOutlet var constraintTop: NSLayoutConstraint!
   @IBOutlet var constraintCenter: NSLayoutConstraint!

   override func viewDidLoad() {
      super.viewDidLoad()
      NotificationCenter.default.addObserver(
         self,
         selector: #selector(keyboardWillShow(notification:)),
         name: UIResponder.keyboardWillChangeFrameNotification,
         object: nil
      )
   }

   @IBAction func logInButton(_ sender: UIButton) {
      print("Login: \(loginTextField.text ?? "")")
      print("Password: \(passwordTextField.text ?? "")")
   }

   @objc func keyboardWillShow(notification: NSNotification) {
      let frameValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      guard let keyboardFullHeight = frameValue?.cgRectValue.height else {
         return
      }
      if keyboardFullHeight > 200 {
         let safeArea = view.frame.height - scrollView.frame.origin.y - scrollView.frame.height
         let keyboardOnScrollHeight = keyboardFullHeight - safeArea
         constraintTop.constant = scrollView.frame.height - bodyView.frame.height - keyboardOnScrollHeight
         constraintCenter.isActive = false
      } else {
         constraintCenter.isActive = true
      }
      UIView.animate(withDuration: 0.3) { [view] in
         view?.layoutIfNeeded()
      }
   }
}
