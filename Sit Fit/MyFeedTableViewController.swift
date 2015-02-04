//
//  MyFeedTableViewController.swift
//  Sit Fit
//
//  Created by Jeanie House on 2/3/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit

class MyFeedTableViewController: FeedTableViewController {


    override func refreshFeed() {
        
        
        FeedData.mainData().refreshMyFeedItems { () -> () in
            
            self.tableView.reloadData()
            
        }
        
    }
    

    
    
    
    
  

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//END
