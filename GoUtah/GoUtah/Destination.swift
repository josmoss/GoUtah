//
//  Destination.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class Destination: NSObject {
    
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
        
       print(image!.imageName)
        
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

}
