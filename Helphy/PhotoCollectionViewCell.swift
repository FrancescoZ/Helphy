//
//  PhotoCollectionViewCell.swift
//  Helphy
//
//  Created by Francesco Zanoli on 19/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var followerNumberLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    public func setImageCell(_ imageToSet:UIImage, withLikes numLikes:String){
        
        photoImageView.image = imageToSet
        followerNumberLabel.text = numLikes
        
        followerNumberLabel.alpha=0
    }
}
