//
//  CurrentWeather.swift
//  thetempis
//
//  Created by Matthew Chess on 4/14/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
   // var currentTime: Int
    var temperature: Double
    var humidity: Int
   // var summary: String
   // var icon: String
    
    
    init(currentWeatherDictionary: NSDictionary) {
        let currentWeather = currentWeatherDictionary["main"] as! NSDictionary
        
        temperature = currentWeather["temp"] as! Double
        humidity = currentWeather["humidity"]as! Int

    }
    
    
   
}




