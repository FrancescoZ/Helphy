//
//  PhotoCell.swift
//  Helphy
//
//  Created by Francesco Zanoli on 16/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//
import UIKit

public class UserCell: UITableViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photographerNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var imageColor:UIColor?
    var contrastImageColor:UIColor?
        
    public func setCell(of namePhotographer:String,withBackground imageToSet:UIImage,withImageProfile profImage:UIImage){
        
        photoImage.image = imageToSet
        
        photographerNameLabel.text = namePhotographer
        photographerNameLabel.sizeToFit()
        
        profileImageView.image = profImage
        
        imageColor = AverageColorFromImage(image: imageToSet)
        contrastImageColor = ContrastColorOf(backgroundColor: imageColor!, returnFlat: true)
        
    }
    
}
