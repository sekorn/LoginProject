//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Scott Kornblatt on 1/17/15.
//  Copyright (c) 2015 Scott Kornblatt. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
  func accountCreated()
}

class CreateAccountViewController: UIViewController {

  @IBOutlet weak var chooseUsernameTextField: UITextField!
  @IBOutlet weak var choosePasswordTextField: UITextField!
  @IBOutlet weak var confirmPasswordTextField: UITextField!
  
  var delegate:CreateAccountViewControllerDelegate?
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func createAccountButtonPressed(sender: UIButton) {
  
    if choosePasswordTextField.text == confirmPasswordTextField.text &&
      choosePasswordTextField.text != nil {
    
        NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUsernameKey)
        NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
        delegate?.accountCreated()
    }
    
  }
  
  @IBAction func cancelButtonPressed(sender: UIButton) {
    self.dismissViewControllerAnimated(true , completion: nil)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
