//
//  FavViewController.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var destinationsArray = [Destination]()
    var favDestination = Destination()
    var currentDestination : Destination?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // print(DataStore.sharedInstance.favoriteDestinations.count)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.sharedInstance.favoriteDestinations.count 
    }
    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//        if editingStyle == UITableViewCellEditingStyle.Delete {
//            
//            print("delete tapped")
//            DataStore.sharedInstance.favoriteDestinations.removeAtIndex(indexPath.row)
//            
//            self.tableView.reloadData()
////            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
////            
////        } else if editingStyle == .Insert {
//            
//        }
//
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! FavTableViewCell
        
        let destination = DataStore.sharedInstance.favoriteDestinations[indexPath.row]
        
        cell.featureImageView.image = destination.image
        
        cell.nameLabel.text = destination.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentDestination = DataStore.sharedInstance.favoriteAtIndex(indexPath.row)
        
        self.performSegueWithIdentifier("proSegue", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "proSegue" {
            
            if let controller = segue.destinationViewController as? ProfileViewController {
                controller.theDestination = self.currentDestination
                
            } else {
                
                print("Not the correct segue")
            }
            
        }
        
    }
    
}