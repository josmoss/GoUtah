//
//  DataStore.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    let kDESTINATIONS = "kDESTINATIONS"
    
    static let sharedInstance = DataStore()
    
    private override init() {
        super.init()
        self.seedData()
        self.loadDefaults()
    }
    
    private var addDestination = [Destination]()
    var favoriteDestinations = [Destination]()
    
    func destinationsAtIndex(index: Int) -> Destination? {
        if self.addDestination.count >= 0 && index < self.addDestination.count {
            return self.addDestination[index]
        }
        return nil
    }
    
    func addDestination(dest: Destination) {
        self.addDestination.append(dest)
    }
    
    func numberOfDestinations() -> Int {
        
        return self.addDestination.count
    }
    
    func favoriteAtIndex(index: Int) -> Destination? {
        if self.favoriteDestinations.count >= 0 && index < self.favoriteDestinations.count {
            return self.favoriteDestinations[index]
        }
        return nil
    }
    
    func addFavoriteDestination(dest: Destination) {
        self.favoriteDestinations.append(dest)
    }
    
    func favoriteNumberOfDestinations() -> Int {
        
        return self.favoriteDestinations.count
    }
    
    func saveDefaults() {
        
        print("Defaults Saved")
        
        let data = NSKeyedArchiver.archivedDataWithRootObject(DataStore.sharedInstance.favoriteDestinations)
        
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: kDESTINATIONS)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    func loadDefaults() {
        
        print("Defaults Loaded")
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kDESTINATIONS) as? NSData {
            
            if let arrayOfDestinations = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Destination] {
                
                self.favoriteDestinations = arrayOfDestinations
                
            }
            
        } else {
            
            print("No items saved")
        }
        
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
                                            print(imageString)
                                            
                                        }
                                        else {
                                            print("Bad Image")
                                        }
                                        
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
                                
                                addDestination(theDestination)
                                
                            }
                        }
                    }
                } catch {
                    print("I can't parse the json data")
                }
                
            }
            
        }
        
        print(numberOfDestinations())
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
    
}
