//
//  CurrentWeather.swift
//  thetempis
//
//  Created by Matthew Chess on 4/14/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import Foundation

struct CurrentWeather {
    
    var currentTime: Int
    var temperature: Double
    var humidity: Int
   // var summary: String
  //  var icon: String
    
    
    init(currentWeatherDictionary: NSDictionary) {
        let currentWeatherMain = currentWeatherDictionary["main"] as! NSDictionary
        let currentWeatherSummary: NSArray = (currentWeatherDictionary.valueForKeyPath("weather.description") as? NSArray)!
        println(currentWeatherSummary)

        
        
        
        currentTime = currentWeatherDictionary["dt"] as! Int
        temperature = currentWeatherMain["temp"] as! Double
        humidity = currentWeatherMain["humidity"]as! Int
       // summary = currentWeatherSummary["discripton"] as! String
      //  icon = currentWeatherSummary["icon"] as! String
        

    }
    
    
   
}




