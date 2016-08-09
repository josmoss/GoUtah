//
//  destImage.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import Foundation

let kDestImageName: String = "destinationImagename"

class destImage: NSObject, NSCoding {
    
    var imageName: String = ""
    
    init(dict: JSONDictionary) {
        
        self.imageName = ""
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.imageName = aDecoder.decodeObjectForKey(kDestDescription) as! String
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.imageName, forKey: kDestDescription)
  
        
    }

    
}