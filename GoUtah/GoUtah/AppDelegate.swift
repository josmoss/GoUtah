//
//  AppDelegate.swift
//  FinalJSONTableView&Profile
//
//  Created by Joe Moss on 7/25/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
//    var locationsArray = [Destination()]


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        seedData()
        
        return true
    }
    
    func seedData() {
        
        if let filePath = NSBundle.mainBundle().URLForResource("destinations", withExtension: "json") {
            
            if let data = NSData(contentsOfURL: filePath)
            {
                
                do
                {
                    
                    if let jsonDict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary
                    {
                        
                        if let destinationsArray = jsonDict["destinations"] as? JSONArray
                        {
                            
                            for destinationsDict in destinationsArray {
                                
                                let theDestination = Destination()
                                
                                if let name = destinationsDict["name"] as? String {
                                    
                                    theDestination.name = name
                                } else {
                                    print("I couldn't parse the name.")
                                }
                                
                                if let description = destinationsDict["description"] as? String {
                                    
                                    theDestination.destDescription = description
                                } else {
                                    print("I couldn't parse the description.")
                                }
                                
                                if let imagesArray = destinationsDict["images"] as? JSONArray
                                {
                                    
                                    for imageDict in imagesArray {
                                        
                                        let images = destImage(dict: imageDict)
                                        
                                        theDestination.imagesArray.append(images)
                                        
                                        if let imageString = imageDict["imageName"] as? String {
                                            
                                           // theDestination.imagesArray.append(imageString)
                                            
                                            images.imageName = imageString
                                           // print(imageString)
                                            
//                                            locationsArray.append(theDestination)
                                            
                                            // Weather API using the locationsArray a for loop and loop each destination latitude and longitude into the api call 
                                            
                                            // for location in locationsArray {
                                            // nsurlSession.url(weather.com/lat/longitude 
                                            //
                                            // }
                                            
                                        }
                                        else {
                                            print("Bad Image")
                                        }

                                           // theDestination.imagesArray.append(imageString)
    
                                        
                                    }
                                    
                                }
                                
                                if let contactInfo = destinationsDict["contactInformation"] as? String {
                                    
                                    theDestination.contactInfo = contactInfo
                                } else {
                                    print("I couldn't parse the contact info.")
                                }
                                
                                if let specialInfo = destinationsDict["specialInformation"] as? String {
                                    
                                    theDestination.specInfo = specialInfo
                                } else {
                                    print("I couldn't parse the special info.")
                                }
                                
                                if let category = destinationsDict["category"] as? String {
                                    
                                    theDestination.category = category
                                } else {
                                    print("I couldn't parse the category.")
                                }
                                
                                if let latitude = destinationsDict["latitude"] as? Double {
                                    
                                    theDestination.latitude = latitude
                                } else {
                                    print("I couldn't parse the latitude.")
                                }
                                
                                if let longitude = destinationsDict["longitude"] as? Double {
                                    
                                    theDestination.longitude = longitude
                                } else {
                                    print("I couldn't parse the longitude.")
                                }
                                
                                if let charge = destinationsDict["charge"] as? String {
                                    
                                    theDestination.charge = charge
                                } else {
                                    print("I couldn't parse the charge.")
                                }
                                
                                DataStore.sharedInstance.addDestination(theDestination)
                                
                            }
                        }
                    }
                } catch {
                    print("I can't parse the json data")
                }
                
            }
            
        }
        
                print(DataStore.sharedInstance.numberOfDestinations())
        //
        //        for theDestination in destinationsArray
        //        {
        //
        //            print(theDestination.name)
        //            print(theDestination.destDescription)
        //            print(theDestination.contactInfo)
        //            print(theDestination.specInfo)
        //            print(theDestination.category)
        //            print(theDestination.latitude)
        //            print(theDestination.longitude)
        //            print(theDestination.charge)
        //
        //            for imageString in theDestination.imagesArray
        //            {
        //                
        //                print(imageString)
        //                
        //            }
        //            
        //        }
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

