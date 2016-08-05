//
//  SelectedImageViewController.swift
//  GoUtah
//
//  Created by Joe Moss on 8/5/16.
//  Copyright © 2016 Touch Tipe LLC. All rights reserved.
//

import UIKit

class SelectedImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var theImage : Destination?
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.image
    }

}
