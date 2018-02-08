//
//  PhotoViewModel.swift
//  Helphy
//
//  Created by Francesco Zanoli on 09/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import Foundation

class PhotoViewModel{
    
    /// Model and property to access to it
    private var photoModel:Photo!
    var ID: String {
        return photoModel.ID
    }
    var name: String {
        return photoModel.Name
    }
    var location: String {
        return photoModel.Location
    }
    var aperture: Double {
        return photoModel.Aperture
    }
    var time: Double {
        return photoModel.Time
    }
    var wb: String {
        return photoModel.WB
    }
    var iso: Int {
        return photoModel.ISO
    }
    var like:Int{
        return photoModel.Like
    }
    
    /// Standard init from a model
    ///
    /// - Parameter model: User Model
    init(model:Photo){
        photoModel=model
    }
    
    func addLike() {
        photoModel.Like += 1
    }
}
