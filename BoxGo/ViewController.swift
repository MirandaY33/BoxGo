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
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!

    //variables 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
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
                self.displayAlertMessage(message: "The combination of username and password is incorrect")
            } else {
                //self.displayAlertMessage(message: "You have logged in!")
                self.performSegue(withIdentifier: "loggedInSegue", sender: self)
            }
        })
        
    }
    
    func handleSignUp() {
        Auth.auth().createUser(withEmail: username.text!, password: password.text!, completion: {
            (user, error) in
            if error != nil {
                if (self.password.text!.characters.count < 6) {
                  self.displayAlertMessage(message: "Password must contain at least 6 characters.")
                } else {
                  self.displayAlertMessage(message: "There is an issue with sign up")
                }
            } else {
                print("user created!")
                self.handleLogin()
            }
        })
        
    }
    
    func displayAlertMessage(message: String)
    {
        let alert = UIAlertController(title: "My Alert", message: message, preferredStyle: .alert);
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(okAction);
        self.present(alert, animated: true, completion: nil);
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

