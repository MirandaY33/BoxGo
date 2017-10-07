//
//  ViewController.swift
//  BoxGo
//
//  Created by Shanshan on 10/3/17.
//  Copyright © 2017 Miranda Zhao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        post()
    }
    
    func post() {
        let title = "Title"
        let message = "My message"
        let post : [String : AnyObject] = ["title" :title as AnyObject,
                                           "message" : message as AnyObject]
        let databaseRef = FIRDatabase.database().reference()
        databaseRef.child("boxgo_accounts").childByAutoId().setValue(post)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

