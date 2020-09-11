//
//  ViewController.swift
//  LoginApp
//
//  Created by Kisacka on 07/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    private let username = "a"
    private let id = "12"
    private let identifier = "WelcomeViewController"
    
    let userDefaults = UserDefaults.standard
    
    let notificationCenter = NotificationCenter.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        // Do any additional setup after loading the view.
    }
    

    
    @objc func keyboardWillShow(notification: Notification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 100
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += 100
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        handleLogin()
    }
    
    func handleLogin() {
        guard userNameTextField.text == username, passwordTextField.text == id  else {
            warningPopUP(withTitle: "Invalid login", withMessage: "Please enter correct login and password")
            return
        }
        
        userDefaults.set(username, forKey: "username")
        userDefaults.set(id, forKey: "id")
        
        goToWelcomeVC()
        userNameTextField.text = ""
        passwordTextField.text = ""
        
    }
    
    func goToWelcomeVC() {
        let initController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifier) as! WelcomeViewController
 //       initController.userName = userNameTextField.text
        view.endEditing(true)
        present(initController, animated: true)
    }
    
    @IBAction func forgotUserTapped(_ sender: Any) {
        
        warningPopUP(withTitle: "Oooops!", withMessage: "Your username is: \(username)")
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        
        warningPopUP(withTitle: "Oooops!", withMessage: "Your password is: \(id)")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesBegan(touches, with: event)
        //this one will hide the keyboard
        view.endEditing(true)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            handleLogin()
        }
        return true
    }
}
