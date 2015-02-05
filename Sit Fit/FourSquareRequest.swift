//
//  FourSquareRequest.swift
//  Maps
//
//  Created by Jeanie House on 2/2/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit
import CoreLocation

let API_URL = "https://api.foursquare.com/v2/"

let CLIENT_ID = "1ICMSKY3TYP31AH44LP2HL3ZGS50IK100VDSTZRWHSFUUSUH"

let CLIENT_SECRET = "IAVHHNHYONTQCB33MBYCS1IICOCCHEBYAOU241HWTH2QNEOY"



class FourSquareRequest: NSObject {
    
    class func requestVenuesWithLocation(location: CLLocation) -> [AnyObject] {
        
        
        let requestString = "\(API_URL)venues/search?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20130815&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
        
        println(requestString)
        
        
        if  let url = NSURL(string: requestString) {
            
             let request = NSURLRequest(URL: url)
            
            
            
            if let data = NSURLConnection.sendSynchronousRequest(request, returningResponse: nil, error: nil) {
                
                if let returnInfo = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? [String:AnyObject] {
                    
                    let responseInfo = returnInfo["response"] as [String:AnyObject]
                    
                    
                    let venues = responseInfo["venues"] as [AnyObject]
                    
                    return venues
                    
                }
                
                
                
            }
            
            
            
        }
        
      
        
    
        
        
        
        //TODO: add implementation to return venues
        
        return []
        
    }
    
    
    
    
   
}





