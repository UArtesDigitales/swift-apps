//
//  ViewController.swift
//  Developer: Omar Sainz
//  Date: 19/October/2015
//  Title: Map Demo
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let latitude:CLLocationDegrees = 20.695527
        
        let longitude:CLLocationDegrees = -103.367560
        
        let latDelta:CLLocationDegrees = 0.09
        
        let lonDelta:CLLocationDegrees = 0.09
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
    }
    
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

