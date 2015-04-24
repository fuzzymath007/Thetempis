//
//  ViewController.swift
//  thetempis
//
//  Created by Matthew Chess on 4/13/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var weatherSummaryLabel: UILabel!

    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var changeOfRainLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBAction func findLocation(sender: UIButton) {
        
        var locationControler:Location?
        
        locationControler = Location()
        
        var currentLocation = locationControler?.getLocation()
        
        println(currentLocation!.currentLat + currentLocation!.currentLong)
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

     
        let apikey = "677c6923d87fa40fc9502f09713aec93"
        
        let location = "ann,arbor"
            
            let baseURL = NSURL(string: "http://api.openweathermap.org/data/2.5/weather?APPID=\(apikey)&q=\(location)")
            
            let sharedSession = NSURLSession.sharedSession()
            
            let downloadTask: NSURLSessionDownloadTask = sharedSession.downloadTaskWithURL(baseURL!, completionHandler : {
                (location: NSURL!, responce: NSURLResponse!, error: NSError!) -> Void in
                
                if (error == nil){
                    let dataObject = NSData(contentsOfURL: location)
                    let weatherDictionary: NSDictionary = NSJSONSerialization.JSONObjectWithData(dataObject!, options: nil, error: nil) as! NSDictionary
                    
                    
                    let currentWeather = CurrentWeather(currentWeatherDictionary: weatherDictionary)
                    
                    var tempInKalvins = currentWeather.temperature
                    
                    var tempInFarinhight = self.convertToFahrenheit(tempInKalvins)
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                        self.tempLabel.text = "\(tempInFarinhight)°"
                        self.humidityLabel.text = "\(currentWeather.humidity)%"
                        self.weatherSummaryLabel.text = currentWeather.summary
                    })
                    
                    
                    
                    
                    println(currentWeather.temperature)
                    println(currentWeather.humidity)
                    println(currentWeather.currentTime!)
                    println(currentWeather.summary)
                    println(currentWeather.id)
                }
 
            })
            
            downloadTask.resume()
   
        }
    
    
    func convertToFahrenheit(tempInKalvins: Double) -> Int{
        let tempInCelcus = tempInKalvins - 273
        
        let tempInFaherenheit = Int(tempInCelcus*(9/5)+32)
        
        return tempInFaherenheit
        
    }
    

}

