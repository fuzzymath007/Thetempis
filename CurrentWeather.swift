//
//  CurrentWeather.swift
//  thetempis
//
//  Created by Matthew Chess on 4/14/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    
    var currentTime: String?
    var temperature: Double
    var humidity: Int
    var summary: String
    var id: Int
    
    
    init(currentWeatherDictionary: NSDictionary) {
        let currentWeatherMain = currentWeatherDictionary["main"] as! NSDictionary
        let descriptionArray: NSArray = (currentWeatherDictionary.valueForKeyPath("weather.description") as? NSArray)!
        let descriptionString = descriptionArray[0] as! String
        let iconArray: NSArray = (currentWeatherDictionary.valueForKeyPath("weather.id") as? NSArray)!
        let iconInt = iconArray[0] as! Int
        
        
        temperature = currentWeatherMain["temp"] as! Double
        humidity = currentWeatherMain["humidity"]as! Int
        summary = descriptionString
        id = iconInt
        
        let currentTimeIntValue = currentWeatherDictionary["dt"] as! Int
        currentTime = dateStringFromUnixtime(currentTimeIntValue)
        

    }
    
    func dateStringFromUnixtime(unixTime: Int) -> String{
        let timeInSecconds = NSTimeInterval(unixTime)
        let weatherDate = NSDate(timeIntervalSince1970: timeInSecconds)
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .ShortStyle
        
        return dateFormatter.stringFromDate(weatherDate)
        
    }
    
    func weatherIconFromID(id: Int) -> UIImage {
        var imageName: String
        
        switch id {
        case 802:
            imageName = "Clouds-100"
        case 800:
            imageName = "Sun-100"
        case 500:
            imageName = "Light Rain-100"
        default:
            imageName = "Sun-100"
        }
        
        var iconImage = UIImage(named: imageName)
        return iconImage!
    }
    
   
}




