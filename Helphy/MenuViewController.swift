//
//  ViewController.swift
//  Helphy
//
//  Created by Francesco Zanoli on 15/06/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import UIKit
import CircleMenu


class MenuViewController: UIViewController,CircleMenuDelegate{
    

    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var menuButton: CircleMenu!
    @IBOutlet weak var camerasButton: UIButton!
    
    let items: [(icon: String, color: UIColor)] = [
        ("home", UIColor(red:0.19, green:0.57, blue:1, alpha:1)),
        ("search", UIColor(red:0.22, green:0.74, blue:0, alpha:1)),
        ("notifications", UIColor(red:0.96, green:0.23, blue:0.21, alpha:1)),
        ("settings-btn", UIColor(red:0.51, green:0.15, blue:1, alpha:1)),
        ("nearby", UIColor(red:1, green:0.39, blue:0, alpha:1)),
        ]

    
    override func viewDidLoad() {
        super.viewDidLoad()    }
    
    override func viewDidAppear(_ animated: Bool) {
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2.0
        menuButton.sendActions(for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToViewController(){
        self.dismiss(animated: true, completion: nil)
    }

    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        
        button.setImage(UIImage(named: items[atIndex].icon), for: .normal)
        
        // set highlited image
        let highlightedImage  = UIImage(named: items[atIndex].icon)?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        button.tintColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        switch atIndex{
        case 1:
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "galleryNavController") as! UINavigationController
            self.performSegue(withIdentifier: "unwindToMenu", sender: self)
            self.present(secondViewController, animated: false)
        default: break
        }
        
    }
    
    func menuCollapsed(_ circleMenu: CircleMenu){
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }

}

