//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Scott Kornblatt on 1/17/15.
//  Copyright (c) 2015 Scott Kornblatt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, CreateAccountViewControllerDelegate {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "loginToCreateAccountViewController" {
      var createAccountVC = segue.destinationViewController as CreateAccountViewController
      createAccountVC.delegate = self
    }
  }

  @IBAction func loginButtonPressed(sender: UIButton) {
    
    let usernameSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kUsernameKey) as String
    println(usernameSavedFromNSUserDefaults)
    let passwordSavedFromNSUserDefaults = NSUserDefaults.standardUserDefaults().objectForKey(kPasswordKey) as String
    println(passwordSavedFromNSUserDefaults)
    
    if usernameTextField.text == usernameSavedFromNSUserDefaults &&
      passwordTextField.text == passwordSavedFromNSUserDefaults {
        self.performSegueWithIdentifier("loginToMainSegue", sender: self)
    }
  }
  
  @IBAction func createAccountButtonPressed(sender: UIButton) {
    self.performSegueWithIdentifier("loginTToCreateAccountSegue", sender: self)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

  // CreateAccountViewControllerDelegate
  func accountCreated() {
    self.performSegueWithIdentifier("loginToMainSegue", sender: nil)
  }
}
