//
//  UserProfileViewController.swift
//  BuddyFinder
//
//  Created by Prasanth Ramineni on 9/24/16.
//  Copyright © 2016 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class UserProfileViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var userNameTextView: UITextView!
    @IBOutlet weak var userImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance().uiDelegate = self
    
        if let user = FIRAuth.auth()?.currentUser {
            print(user.displayName)
            self.userNameTextView.text = user.displayName
        } else {
            print("User Not Signed In!!!!")
        }
        
        
//        FIRAuth.auth()?.addStateDidChangeListener{auth, user in
//            if let user = user { // User Logged In
//                self.userNameTextView.text = user.displayName
//            } else { // User Not Logged In
//                print("No User Logged In")
//            }
//        }
    }
    
    // Sign Out User on Button Click
    @IBAction func signOutUser(_ sender: UIButton) {
        
        //SignOut From Google
        GIDSignIn.sharedInstance().signOut()
        
        //Sign Out From Firebase
        try! FIRAuth.auth()!.signOut()
    }
}
