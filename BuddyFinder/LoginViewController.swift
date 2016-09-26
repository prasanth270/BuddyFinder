//
//  ProfileViewController.swift
//  BuddyFinder
//
//  Created by Prasanth Ramineni on 9/24/16.
//  Copyright © 2016 Prasanth Ramineni. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Executed Before viewDidLoad()
    override func viewWillAppear(_ animated: Bool) {
        
        // Delegate GIDSignIn with an instance of this class
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Sign in Silently - Doesn't ask to 'Allow' Everytime user opens App
        GIDSignIn.sharedInstance().signInSilently()
        
        // Check if user is signed in. Can also use .currentUser | Check Manage Users Firebase
        FIRAuth.auth()?.addStateDidChangeListener{ auth, user in
            if let user = user { // User Logged In
                print("USer Id" + user.uid)
                if let view = self.storyboard!.instantiateViewController(withIdentifier: "mainStoryBoardView") as? MainViewController {
                    self.present(view, animated: true, completion: nil)
                }
            } else { // User Not Logged In - Log Info and Stay in the Same page
                print("User Not Logged In")
            }
        }
    }
}
