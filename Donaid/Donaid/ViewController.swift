//
//  ViewController.swift
//  Donaid
//
//  Created by Kamal Ezz on 2015-07-23.
//  Copyright (c) 2015 Kamal Ezz. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
   // var signUpViewController: PFSignUpViewController! = PFSignUpViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil) {
        
            
            var logInViewController = PFLogInViewController()
            
            logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.Twitter | PFLogInFields.Facebook | PFLogInFields.DismissButton
            

            logInViewController.delegate=self
            
            var signUpViewController = PFSignUpViewController()
            signUpViewController.delegate=self
            
            logInViewController.signUpController = signUpViewController
            
            self.presentViewController(logInViewController
                , animated: true, completion: nil)
            
          /*  self.logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.Twitter | PFLogInFields.Facebook
            
                var logInLogoTitle = UILabel()
                logInLogoTitle.text = "Donaid"
            
                self.logInViewController.logInView!.logo = logInLogoTitle
            
                self.logInViewController.delegate=self

                var signUpLogoTitle = UILabel()
                signUpLogoTitle.text = "Donaid"
            
            self.signUpViewController.signUpView?.logo=signUpLogoTitle
        
            self.signUpViewController.delegate = self
            
            self.logInViewController.signUpController = self.signUpViewController */
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

            //Parse Login
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        if (username.isEmpty || password.isEmpty){
            let alert = UIAlertView()
            alert.title = "Alert"
            alert.message = "Please enter Username and Password."
            alert.addButtonWithTitle("Dismiss")
            alert.show()
            return false
        }else  {
            return true
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        println("Login Successful!")

        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        let alert = UIAlertView()
        alert.title = "Alert"
        alert.message = "Failed to login."
        alert.addButtonWithTitle("Dismiss")
        alert.show()


        println("Failed to login bro!")
        

    }
            //Parse Sign Up
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        println("User signed up!")

        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("Failed to sign up.....")

    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("User dismissed sign up.")
    }
    
    // Mark: Actions
  
 @IBAction func simpleAction (sender: AnyObject){

        self.presentViewController(self.logInViewController, animated: true, completion: nil)
        //self.performSegueWithIdentifier("Ready", sender: self)
    }

    
    @IBAction func LogOut (sender: AnyObject){
       
        PFUser.logOut()
    }
}

