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
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        //Sign in Silently
        //GIDSignIn.sharedInstance().signInSilently()
        
        // Check if user is signed in
        FIRAuth.auth()?.addStateDidChangeListener{ auth, user in
            if let user = user { // User Logged In
                print("USer Id" + user.uid)
                if let view = self.storyboard!.instantiateViewController(withIdentifier: "mainStoryBoardView") as? MainViewController {
                    self.present(view, animated: true, completion: nil)
                }
            } else { // User Not Logged In
                // Log Info and Stay in the Same page
                print("User Not Signed")
            }
        }
    }
}
