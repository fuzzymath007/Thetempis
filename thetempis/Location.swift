//
//  Location.swift
//  thetempis
//
//  Created by Matthew Chess on 4/21/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import Foundation
import CoreLocation


class Location: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    
    var userLocation: CLLocation?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
        case .NotDetermined:
            println(".NotDetermined")
            break
            
        case .AuthorizedAlways:
            println(".AuthorizedAlways")
            self.locationManager.startUpdatingLocation()
            break
            
        case .AuthorizedWhenInUse:
            println("AuthorizedWhenInUse")
            self.locationManager.startUpdatingLocation()
            break
            
        case .Denied:
            println(".Denied")
            break
            
        default:
            println("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        userLocation = locations.last as? CLLocation
        
 
    }
    
//    func getLocation() -> (currentLat: CLLocationDegrees, currentLong: CLLocationDegrees){
//        
//
//        
//    }
}