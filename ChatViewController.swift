//
//  ChatViewController.swift
//  ParseChater
//
//  Created by Jared Davidson on 6/23/16.
//  Copyright © 2016 ForceChat. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var numberOfMessages = Int()
    
    override func viewDidLoad() {
        numberOfMessages = 3
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfMessages
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("MessageCellMe") as! ChatTableViewCell
        
            
        return cell
        

        
    }
    
}