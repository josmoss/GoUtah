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
    private override init() { }
    
    private var addDestination = [Destination]()
    private var addFavoriteDestination = [Destination]()
    
    
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
        
        if self.addFavoriteDestination.count >= 0 && index < self.addFavoriteDestination.count {
            return self.addFavoriteDestination[index]
        }
        return nil
    }
    
    func addFavoriteDestination(dest: Destination) {
        self.addFavoriteDestination.append(dest)
    }
    
    func favoriteNumberOfDestinations() -> Int {
        
        return self.addFavoriteDestination.count
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
    
//    func removeDestination(destination: destinationToRemove) {
//        
//        
//        
//    }

}
