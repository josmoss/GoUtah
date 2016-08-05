//
//  DataStore.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    static let sharedInstance = DataStore()
    private override init() { }
    
    private var addDestination = [Destination]()
    private var addFavoriteDestination = [Destination]()
    
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


}
