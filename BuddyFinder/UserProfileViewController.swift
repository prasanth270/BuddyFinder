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
    
        //.currentUser will return true is a user is Signed In
        if let user = FIRAuth.auth()?.currentUser {
            self.userNameTextView.text = user.displayName
            try! self.userImageView.image = UIImage(data: NSData(contentsOf: user.photoURL!) as Data)
        } else { // Log No User Signed In and Redirect to LoginView Controller
            print("User Not Signed In!!!!")
        }
    }
    
    // Sign Out User on Button Click
    @IBAction func signOutUser(_ sender: UIButton) {
        
        //SignOut From Google
        GIDSignIn.sharedInstance().signOut()
        
        //Sign Out From Firebase
        try! FIRAuth.auth()!.signOut()
    }
}
