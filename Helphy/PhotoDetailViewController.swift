//
//  DetailViewController.swift
//  Helphy
//
//  Created by Francesco Zanoli on 16/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//


import UIKit

enum PhotoDetailMode{
    case UICell,DetailProfile
}

public class PhotoDetailViewController: UIViewController {
    
    var username:String!
    var loadedPhotos:Array<PhotoViewModel>!
    var photos:Array<PhotoViewModel>!
    var openMode:PhotoDetailMode!
    var photoIndex:Int = 0
    
    
    @IBOutlet public var generalViewContainer: UIView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photographerNameButton: UIButton!
    @IBOutlet weak var dataContainerView: UIView!
    @IBOutlet weak var closeButton: UIButton!

    @IBOutlet var swipeRight: UISwipeGestureRecognizer!
    @IBOutlet var swipeLeft: UISwipeGestureRecognizer!
    @IBOutlet var swipeUp: UISwipeGestureRecognizer!
    
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = UIImage(named: loadedPhotos[photoIndex].location)
        photographerNameButton.titleLabel?.text  = username
    }
    
    @IBAction func unwindToViewController(){
        self.dismiss(animated: true, completion: nil)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        loadedPhotos=nil
    }
    

    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        photoIndex -= 1
        if (photoIndex < 0){
            photoIndex = 0
        }
        photoIndex = photoIndex % loadedPhotos.count
        let imageName = loadedPhotos[photoIndex].location
        
        if let image = UIImage(named: imageName) {
            photoImageView.image = image
        }
        self.loadedPhotos = loadNextAndPrev(toIndex: photoIndex,
                                            from: photos,
                                            inRange: 1)
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        photoIndex += 1
        if (photoIndex > loadedPhotos.count){
            photoIndex = loadedPhotos.count
        }
        let imageName = loadedPhotos[photoIndex].location
        
        if let image = UIImage(named: imageName) {
            photoImageView.image = image
        }
        self.loadedPhotos = loadNextAndPrev(toIndex: photoIndex,
                                            from: photos,
                                            inRange: 1)
    }

    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
       exit()
    }
    
    @IBAction func closeTouch(_ sender: UIButton) {
        exit()
    }
    
    func animateTable() {
        guard let generalViewContainer = self.generalViewContainer
            else {   return    }
        let viewWitdh: CGFloat = generalViewContainer.bounds.size.width
        generalViewContainer.transform=CGAffineTransform(translationX:  0 ,
                                                         y: 0 )
        
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: UIViewAnimationOptions.transitionFlipFromLeft
            , animations: {
                generalViewContainer.transform=CGAffineTransform(
                    translationX:  0,
                    y: -viewWitdh )
        }, completion: nil)
        
        
    }
    
    func setupView(forUsername username:String,
                   withPhotos photos:Array<PhotoViewModel>,
                   atIndex photoIndex:Int,
                   inMode mode:PhotoDetailMode){
        self.photoIndex = photoIndex
        self.username = username
        self.photos = photos
        self.openMode = mode
        self.loadedPhotos = loadNextAndPrev(toIndex: photoIndex,
                                            from: photos,
                                            inRange: 2)
        
    }
    
    func loadNextAndPrev(toIndex index:Int,
                         from photos:Array<PhotoViewModel>,
                         inRange increment:Int)
        -> Array<PhotoViewModel>
    {
        return photos.enumerated().filter({ (photoIndex, photo) in
            if  photoIndex >= index+increment ||
                photoIndex <=  index-increment{
                return true
            }
            return false
        }).sorted(by: { $0.offset > $1.offset }).map{ $0.element }
    }
    
    func exit(){
        switch openMode! {
        case .UICell:
            _ = navigationController?.popViewController(animated: true)
            break
        case .DetailProfile:
             self.performSegue(withIdentifier: "unwindToProfileViewController",
                               sender: self)
            break
        }
    }
    
}
