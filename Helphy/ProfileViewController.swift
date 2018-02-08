//
//  ProfileViewController.swift
//  Helphy
//
//  Created by Francesco Zanoli on 19/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import UIKit
import CoreImage

class ProfileViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    fileprivate let items = [("11", "River cruise"), ("2", "North Island"), ("3", "Mountain trail"), ("4", "Southern Coast"), ("5", "Fishing place")] // image names


    @IBOutlet weak var imagesGallery: UICollectionView!
    
    @IBOutlet weak var backgroundProfileImage: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var subscribeButton: UIButton!
    
    @IBOutlet weak var subscribersLabel: UILabel!
    @IBOutlet weak var subscribersValueLabel: UILabel!
    @IBOutlet weak var subscribedLabel: UILabel!
    @IBOutlet weak var subscribedValueLabel: UILabel!
    
    var context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userProfileImage.layer.cornerRadius = self.userProfileImage.frame.size.width / 2;
        self.userProfileImage.clipsToBounds = true;
        
        self.userProfileImage.layer.borderWidth = 3.0;
        self.userProfileImage.layer.borderColor = UIColor.white.cgColor;
        
        // get a global concurrent queue
        let queue = DispatchQueue.global()
        // submit a task to the queue for background execution
        queue.async {
            let enhancedImage = self.bluer(image: self.backgroundProfileImage.image!) // expensive operation taking a few seconds
            // update UI on the main queue
            DispatchQueue.main.async {
                self.backgroundProfileImage.image = enhancedImage
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundProfileImage.alpha = 1
                }) { completed in
                    // add code to happen next here
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath as IndexPath) as! PhotoCollectionViewCell
        
        let index = indexPath.row % items.count
        let imageName = items[index].0
        let imageLike = items[index].0
        
        if let image = UIImage(named: imageName) {
            cell.setImageCell(image,withLikes: imageLike)
        }

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let sender:AnyObject = index as AnyObject
        self.performSegue(withIdentifier: "photoCellCollectionSegue", sender: sender )
    }
    
   
    
    @IBAction func followClickButton(_ sender: Any) {
        subscribeButton.setImage(#imageLiteral(resourceName: "slr_camera_filled"), for: UIControlState.normal)
    }
    
    ///TODO Create utilities
    
    func bluer(image:UIImage) -> UIImage{
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: image)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(10, forKey: kCIInputRadiusKey)
        
        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")
        
        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
}
