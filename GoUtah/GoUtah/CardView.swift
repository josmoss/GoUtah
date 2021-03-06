//
// CardView.swift
//
// Attributed to Phillip Wright.
//
//

import UIKit

class CardView: UIView {
    var destination : Destination! {
        didSet {
            
            imageView.image = destination.image
            nameLabel.text = destination.name
            
        }
    }
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        defaultInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultInit()
    }
    
    func defaultInit() {
        self.backgroundColor = UIColor(red: 1.0, green: 0.60, blue: 0.55, alpha: 1.0)
        
        for v in [imageView, nameLabel] {
            v.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(v)
        }
        
        //Image View
        NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: imageView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0.8, constant: 0).active = true
        
        //Name
        NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .CenterX , relatedBy: .Equal, toItem: self, attribute: .CenterX , multiplier: 1, constant: 0).active = true
        
        NSLayoutConstraint(item: nameLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        
        nameLabel.textAlignment = .Center
        nameLabel.font = UIFont(name: "Avenir", size: 20)
        nameLabel.textColor = UIColor.blackColor()
        
        
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        self.imageView.contentMode = .ScaleAspectFill
        self.imageView.clipsToBounds = true
    }
}