//
//  CardStackViewController.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class CardStackViewController: UIViewController, CardStackDelegate {

    @IBOutlet weak var cardStackView: CardStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cardStackView.delegate = self
        
        
        if DataStore.sharedInstance.favoriteDestinations.count >= 0 {
            
            DataStore.sharedInstance.loadDefaults()
            
            print("Number of saved destinations \(DataStore.sharedInstance.favoriteDestinations.count)")
         
        }
        
    }
    
    func cardInterested(dest: Destination) {
        print("interested in \(dest.name)")
        
        DataStore.sharedInstance.addFavoriteDestination(dest)
    //Append interested destinations into favorite destitions array 
        DataStore.sharedInstance.favoriteDestinations.append(dest)

        
    }
    
    func cardNotInterested(dest: Destination) {
        print("not interested in \(dest.name)")
    }

}
