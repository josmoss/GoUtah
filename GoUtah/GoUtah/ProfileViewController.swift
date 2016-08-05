//
//  ProfileViewController.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

protocol WeatherDelegate : class {
    func passWeather(theWeather: Weather)
}

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, WeatherDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var destDescription: UITextView!
    @IBOutlet weak var contactInfoLabel: UILabel!
    @IBOutlet weak var chargeLabel: UILabel!
    @IBOutlet weak var specInfoLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    var theDestination : Destination?
    var theWeather : Weather?
    let apiController = WeatherAPIController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let destination = self.theDestination {
            
            self.nameLabel.text = destination.name
            self.destDescription.text = destination.destDescription
            self.contactInfoLabel.text = destination.contactInfo
            self.chargeLabel.text = destination.charge
            self.specInfoLabel.text = destination.specInfo
        
            for imgString in destination.imagesArray {
              // print(imgString)
        
            if let weather = self.theDestination {
                    
                let latlong = "\(weather.latitude)" + "," + "\(weather.longitude)"
                        
                        apiController.fetchWeather(latlong)
                }
            }
            
        }
    }
    
    func passWeather(theWeather: Weather) {
        //      implement the Weather user interface
        
//              print(theWeather.icon)
//              print(theWeather.temperature)
        
        dispatch_async(dispatch_get_main_queue(), {
            
            // Updating the UI
            
            let temp = Int(theWeather.temperature)
            
            self.tempLabel.text = "\(temp)"

        })
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let images = theDestination?.imagesArray
 
        return images!.count

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let images = theDestination?.imagesArray
        
        let image = images![indexPath.row]
        
        cell.imageView.image = UIImage(named: image.imageName)
 
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        performSegueWithIdentifier("showMap", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showMap" {
            
            if let controller = segue.destinationViewController as? MapViewController {
                
                controller.theMap = self.theDestination
                
            } else {
                print("Not the correct segue")
            }
            
        }
        
        if segue.identifier == "showImage" {
            
            if let controller = segue.destinationViewController as? SelectedImageViewController {
                
                controller.theImage = self.theDestination
                
            } else {
                print("Not the correct segue")
            }
            
        }
        
    }

}
