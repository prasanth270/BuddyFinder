//
//  ViewController.swift
//  BuddyFinder
//
//  Created by Prasanth Ramineni on 9/24/16.
//  Copyright © 2016 Prasanth Ramineni. All rights reserved.
//

import UIKit
import MapKit

class MainViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var selectSegmentView: UISegmentedControl!
    @IBOutlet weak var groupsTableView: UITableView!
    
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager = CLLocationManager()
            
            //Authorization for Always Using Location
            self.locationManager.requestAlwaysAuthorization()
            
            //Authorization for Using Location When App is in Use
            self.locationManager.requestWhenInUseAuthorization()
            
            locationManager.delegate = self
            
            // Location Accuracy
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            
            // Asynchronous Call to Location Manager Delegate - didUpdateLocations
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get Current Location Values From GPS
        let locationValues:CLLocationCoordinate2D = (manager.location?.coordinate)!
        
        print("\(locationValues.latitude), \(locationValues.longitude)")
        
        //Map Span in UI
        let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //Map Region With Center as User Location
        let mapRegion = MKCoordinateRegion(center: locationValues, span: mapSpan)
        
        //Annotation for Pin on Map
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = locationValues
        
        // Update Map Region on Map Kit and Drop pin
        self.mapView.setRegion(mapRegion, animated: true)
        self.mapView.addAnnotation(dropPin)
    }

}

