//
//  Destination.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

let kTrackName = "trackName"
let kDestDescription = "destDescription"
let kImagesArray = "imagesArray"
let kContactInfo = "contactInfo"
let kSpecInfo = "specInfo"
let kCategory = "category"
let kLatitude = "latitude"
let kLongitude = "longitude"
let kCharge = "charge"

class Destination: NSObject, NSCoding {
    
    var name: String = ""
    var destDescription: String = ""
    var imagesArray = [destImage]()
    var contactInfo: String = ""
    var specInfo: String = ""
    var category: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var charge: String = ""
    
    var image : UIImage {
        
         let image = imagesArray.first
        
       //print(image!.imageName)
        
       return UIImage(named: image!.imageName)!

    }
    
    override init() {
        
        self.name = ""
        self.destDescription = ""
        self.contactInfo = ""
        self.specInfo = ""
        self.category = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.charge = ""
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey(kTrackName) as! String
        self.destDescription = aDecoder.decodeObjectForKey(kDestDescription) as! String
        self.imagesArray = aDecoder.decodeObjectForKey(kImagesArray) as! NSArray as! [destImage]
        self.contactInfo = aDecoder.decodeObjectForKey(kContactInfo) as! String
        self.specInfo = aDecoder.decodeObjectForKey(kSpecInfo) as! String
        self.category = aDecoder.decodeObjectForKey(kCategory) as! String
        self.latitude = aDecoder.decodeObjectForKey(kLatitude) as! Double
        self.longitude = aDecoder.decodeObjectForKey(kLongitude) as! Double
        self.charge = aDecoder.decodeObjectForKey(kTrackName) as! String
        
        super.init()
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.name, forKey: kTrackName)
        aCoder.encodeObject(self.destDescription, forKey: kDestDescription)
        aCoder.encodeObject(self.imagesArray, forKey: kImagesArray)
        aCoder.encodeObject(contactInfo, forKey: kContactInfo)
        aCoder.encodeObject(specInfo, forKey: kSpecInfo)
        aCoder.encodeObject(category, forKey: kCategory)
        aCoder.encodeObject(latitude, forKey: kLatitude)
        aCoder.encodeObject(longitude, forKey: kLongitude)
        aCoder.encodeObject(charge, forKey: kCharge)
        
    }

}
