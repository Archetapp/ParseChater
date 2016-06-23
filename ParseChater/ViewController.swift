//
//  ViewController.swift
//  ParseChater
//
//  Created by Nona M on 6/21/16.
//  Copyright © 2016 ForceChat. All rights reserved.
//

import UIKit
import Parse

protocol SelectSingleViewControllerDelegate {
    func didSelectSingleUser(user: PFUser)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTable: UITableView!
    
     
    
    var users = [PFUser]()
    var delegate: ViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUsers()
    }

    
    func loadUsers() {
        let user = PFUser.currentUser()
        var query = PFQuery(className: PF_USER_CLASS_NAME)
        query.whereKey(PF_USER_OBJECTID, notEqualTo: user!.objectId!)
        
        query.orderByAscending(PF_USER_FULLNAME)
        query.limit = 1000
        query.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            if error == nil {
                self.users.removeAll(keepCapacity: false)
                if let array = objects as? [PFUser] {
                    for obj in array {
                        if let username = (obj as PFUser)[PF_USER_FULLNAME] as? String {
                            self.users.append(obj as PFUser)
                        }
                    }
                }
                
                //self.users += objects as! [PFUser]!
                self.myTable.reloadData()
            } else {
                print("Network error")
            }
            
        }
    }

    
   
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        let user = self.users[indexPath.row]
        cell.textLabel?.text = user[PF_USER_FULLNAME] as? String
        
        return cell

    }

 
   
}