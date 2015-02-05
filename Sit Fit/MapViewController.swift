//
//  MapViewController.swift
//  Sit Fit
//
//  Created by Jeanie House on 2/5/15.
//  Copyright (c) 2015 Jeanie House. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class MapViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func refreshFeed() {
        
        
        FeedData.mainData().refreshFeedItems { () -> () in
  
            
            self.createAnnotationsWithSeats(FeedData.mainData().feedItems)
            
            
        }
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshFeed()
        
    }
    
        
        
    // MAKE ANNOTATIONS FOR FEED ITEMS
    
    func createAnnotationsWithSeats(seats: [PFObject]) {
        
        for seat in seats {
            
            let venue = seat["venue"] as [String:AnyObject]
            
            let locationName = venue["name"] as String
            
            
            
            let locationInfo = venue["location"] as [String:AnyObject]
            
            let lat = locationInfo["lat"] as CLLocationDegrees
            let lng = locationInfo["lng"] as CLLocationDegrees
            
            let coordinate = CLLocationCoordinate2DMake(lat,lng)
            
            let annotation = MKPointAnnotation()
            
            annotation.setCoordinate(coordinate)
            
            mapView.addAnnotation(annotation)
            
            
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
            var information = MKPointAnnotation()
            information.coordinate = location
            information.title = seat["name"] as String
            information.subtitle = "subtitle"
            
            
            mapView.addAnnotation(information)
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

}//END
