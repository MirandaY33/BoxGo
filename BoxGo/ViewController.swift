//
//  ViewController.swift
//  BoxGo
//
//  Created by Shanshan on 10/3/17.
//  Copyright © 2017 Miranda Zhao. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {


    //outlets
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //variables

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //actions
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        handleSignUp()
    }
    @IBAction func signInClicked(_ sender: UIButton) {
        handleLogin()
    }
    
    //functions
//    func post() {
//        let title = "Title"
//        let message = "My message"
//        let post : [String : AnyObject] = ["title" :title as AnyObject,
//                                           "message" : message as AnyObject]
//        let databaseRef = FIRDatabase.database().reference()
//        databaseRef.child("boxgo_accounts").childByAutoId().setValue(post)
//        
//    }
    
    func handleLogin() {

        Auth.auth().signIn(withEmail: username.text!, password: password.text!, completion: {
            user, error in
            if error != nil {
                print("username or password is inccorect")
            } else {
                print("logged in!")
            }
        })


        
    }
    
    func handleSignUp() {
        Auth.auth().createUser(withEmail: username.text!, password: password.text!, completion: {
            (user, error) in
            if error != nil {
                print("error")
            } else {
                print("user created!")
                self.handleLogin()
            }
            
        })
        
    }
    



}

