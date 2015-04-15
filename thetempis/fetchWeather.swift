//
//  FetchWeather.swift
//  thetempis
//
//  Created by Matthew Chess on 4/13/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import UIKit
import Foundation

struct Weather {
    
   // var currentTime: Int
    var temperature: Double
    var humidity: Int
   // var summary: String
  //  var icon: String
    
    init(weatherDictionary: NSDictionary){
        let currentWeather = weatherDictionary["main"] as! NSDictionary
        
        
        //currentTime = currentWeather["dt"] as! Int
        temperature = currentWeather["temp"] as! Double
        humidity = currentWeather["humidity"] as! Int
        //summary = currentWeather["description"] as! String
       // icon = currentWeather["icon"] as! String
        
    }
    
    
}

private let apikey = "677c6923d87fa40fc9502f09713aec93"

let location = "ann,arbor"

class FetchWeather: NSObject {
    
    
    
    
   
}
