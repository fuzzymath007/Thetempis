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
        println("didChangeAuthorizationStatus")
        
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
        
        println(locations)
        
        userLocation = locations[0] as? CLLocation
        
        
        
    }
    
    func getLocation() -> (currentLat: CLLocationDegrees, currentLong: CLLocationDegrees){
        
        var currentLat = userLocation?.coordinate.latitude
        
        var currentLong = userLocation?.coordinate.latitude
        
        
        return (currentLat!, currentLong!)
    
    
    }
    
}

