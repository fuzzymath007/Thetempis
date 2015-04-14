//
//  FetchWeather.swift
//  thetempis
//
//  Created by Matthew Chess on 4/13/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import UIKit
import Foundation

private let apikey = "677c6923d87fa40fc9502f09713aec93"

let location = "London,uk"

class FetchWeather: NSObject {
    
    func getWeather() {
    
    let baseURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?APPID=\(apikey)&q=\(location)")
    
    let sharedSession = NSURLSession.sharedSession()
    
    let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(baseURL!, completionHandler : {
        (location: NSURL!, responce: NSURLResponse!, error: NSError!) -> Void in
        
        if (error == nil){
            let dataObject = NSData(contentsOfURL: location)
            let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
            println(weatherDictionary)
        }
        
        
    })
    
    downloadTask.resume()
    
    }
    
    
   
}
