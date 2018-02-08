//
//  Photo.swift
//  Helphy
//
//  Created by Francesco Zanoli on 07/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import Foundation

/// Photo taken with helphy
class Photo{
    
    /// Photo identifier
    var ID:String
    /// Name of the photo, usually the name in the path
    var Name:String
    /// The path of the real data
    var Location:String
    
    /// Parameters of exposure,ISO
    var ISO:Int
    var Aperture:Double
    var Time:Double
    var WB:String
    
    //Parameter for the social
    var Like:Int
    
    /// Caracteristcs of the photo to analyse it with AI
    var Subjects:Array<String>?
    var Colors:Array<String>?
    var Techniques:Array<String>?
    
    /// Init fuction with all the necessary data
    ///
    /// - Parameters:
    ///   - Name: Name of the file
    ///   - Location: Path of the image
    ///   - ISO: ISO value of the image
    ///   - Aperture: Aperture time of the image
    ///   - Time: Aperture time of the image
    ///   - WB: White balance informations
    ///   - Like: Number of like received
    init(ID:String,Name:String,Location:String,ISO:Int,Aperture:Double,Time:Double,
         WB:String,Like:Int){
        self.ID=ID
        self.Name=Name
        self.Location=Location
        self.ISO=ISO
        self.Aperture=Aperture
        self.Time=Time
        self.WB=WB
        self.Like=Like
    }
    
    
    /// Initializate the object to a default image, used to test
    init(_ ID:String){
        self.ID=ID
        self.Name="Default"
        self.Location="/Default.png"
        self.ISO=0
        self.Aperture=0
        self.Time=0
        self.WB=""
        self.Like=0
    }
    
}
