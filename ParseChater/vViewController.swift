//
//  vViewController.swift
//  ParseChater
//
//  Created by Nona M on 6/21/16.
//  Copyright © 2016 ForceChat. All rights reserved.
//

import UIKit
import Parse
class vViewController: UIViewController {

    
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        let current = PFUser.currentUser()
        if current != nil
        {
          
        }
        else
        {
            
            self.performSegueWithIdentifier("goSignIn", sender: self)
        }
    }

    @IBAction func Logout(sender: UIButton) {
        PFUser.logOut()
        self.performSegueWithIdentifier("goSignIn", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
