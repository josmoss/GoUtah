//
//  WeatherAPIController.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class WeatherAPIController: NSObject {
    
    weak var delegate: WeatherDelegate?
    
    let session = NSURLSession.sharedSession()
    
    func fetchWeather(latlong: String) {
        
        let urlString = "https://api.forecast.io/forecast/f8fd1bf1ef483fb79f068ceea4fef13c/\(latlong)"
        //print(urlString)
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                
                if let data = data {
                    
                    do {
                        
                        if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                            //print(jsonDictionary)
                            
                            if let currentlyDict = jsonDictionary["currently"] as? JSONDictionary{
                                
                                let w = Weather(dict: currentlyDict)
                                
                                self.delegate?.passWeather(w)
                                
//                                print(w.summary)
//                                print(w.icon)
//                                print(w.precipProbability)
//                                print(w.temperature)
//                                print(w.humidity)
//                                print(w.windSpeed)
                                
                            } else {
                                print("Invalid location")
                            }
                            
                        }
                        
                    } catch {
                        print("I could not parse the jsonDictionary")
                    }
                    
                } else {
                    print("I could not unwrap the data")
                }
                
            })
            task.resume()
            
        } else {
            print("Not a valid url")
        }
        
    }

}
