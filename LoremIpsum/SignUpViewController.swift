//
//  SignUpViewController.swift
//  LoremIpsum
//
//  Created by Brianna Butler on 7/18/20.
//  Copyright © 2020 Bilge Tatar. All rights reserved.
//

import UIKit
import FirebaseDatabase

var globalUsername = ""
class SignUpViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func createAccount(_ sender: Any) {
        ref?.child("User").childByAutoId().setValue(username.text);
        globalUsername = username.text!
    }
    var postData = [String]()
    var ref: DatabaseReference?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        
            }
          // ...

        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
