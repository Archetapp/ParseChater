//
//  SignInViewController.swift
//  ParseChater
//
//  Created by Nona M on 6/21/16.
//  Copyright © 2016 ForceChat. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LoginAction(sender: UIButton) {
        if SignIn.hasEmptyFields(userName.text!, password: password.text!) {
            self.errorLabel.text = Error.IncorrectSignIn.description
            return
        }
        
        activityIndicator.startAnimating()
        activityLabel.text = "Logging In Now..."
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0))
            {
                SignIn.loginUserAsync(self.userName.text!, password: self.password.text!, completion:
                    { (success: Bool) -> Void in
                        //update UI
                        if success
                        {
                            dispatch_async(dispatch_get_main_queue())
                                {
                                    ParseModel.delay(seconds: 2, completion: {
                                        print("Login successful")
                                        self.activityLabel.text = "Login Successful"
                                        ParseModel.delay(seconds: 1.5, completion:
                                            {
                                                self.showHomeView()
                                        })
                                    })
                            }
                        }
                        else
                        {
                            dispatch_async(dispatch_get_main_queue())
                                {
                                    self.activityIndicator.stopAnimating()
                                    self.userName.resignFirstResponder()
                                    self.activityLabel.text = ""
                                    self.errorLabel.text = Error.IncorrectSignIn.description
                            }
                        }
                })
                
        }
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    func showHomeView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeView = storyboard.instantiateViewControllerWithIdentifier("HomeView")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = HomeView
    }
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


