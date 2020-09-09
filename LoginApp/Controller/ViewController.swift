//
//  ViewController.swift
//  LoginApp
//
//  Created by Kisacka on 07/09/2020.
//  Copyright © 2020 Kisacka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    private let username = "a"
    private let id = "12"
    
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
    }
    
    
    @IBAction func forgotUserTapped(_ sender: Any) {
        
        warningPopUP(withTitle: "Oooops!", withMessage: "Your username is: \(username)")
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        
        warningPopUP(withTitle: "Oooops!", withMessage: "Your password is: \(id)")

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //this one will hide the keyboard
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}

