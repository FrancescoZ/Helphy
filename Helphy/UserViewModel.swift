//
//  UserViewModel.swift
//  Helphy
//
//  Created by Francesco Zanoli on 08/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class UserViewModel{
    
    let disposeBag = DisposeBag()
    
    /// Model and property to access to it
    private var userModel:User!
    var ID: String {
        return userModel.ID
    }
    var name: String {
        return userModel.Name
    }
    var surname: String {
        return userModel.Surname
    }
    var nickname: String {
        return userModel.Nickname
    }
    var email: String {
        return userModel.Email
    }
    var bio: String {
        return userModel.Bio
    }
    var profileImage: String? {
        return userModel.ProfileImage
    }
    var backgroundProfileImage: String? {
        return userModel.BackgroundProfileImage
    }
    var receivedLike: Int {
        return userModel.receivedLike
    }
    
    
    /// Standard init from a model
    ///
    /// - Parameter model: User Model
    init(model:User){
        userModel=model
    }
    
    
    /// Add a photo to the user's gallery
    ///
    /// - Parameter photo: Photo to add to the gallery
    func addPhotoToGallery(_ photo:Photo){
        userModel.Gallery.append(photo)
    }
    
    /// Return photos from the gallery in a different array, containing the
    /// N photos startin to the index from until the index to
    /// NB it throw an exception if parameter are incorrect
    ///
    /// - Parameters:
    ///   - from: Index of start, must be greater or equal to zero
    ///   - to: Index of end, must be greater and start
    /// - Returns: return the photos from FROM to TO in the gallery, if the TO
    ///     is bigger than the gallery size it return
    func getPhotosFromGallery(from:Int, to:Int) -> Array<PhotoViewModel>{
        var max = to
        if to>userModel.Gallery.count{
            max = userModel.Gallery.count
        }
        
        if from>to || from<0{
            return Array<PhotoViewModel>()
        }
        return Array(userModel.Gallery[from..<max].map(({
            (photo: Photo) -> PhotoViewModel in
            return PhotoViewModel(model: photo)
        })))
    }
    
    /// User Gallery Photo count
    ///
    /// - Returns: User's gallery photo count
    func getGalleryCount() -> Int{
        return userModel.Gallery.count
    }
    
    /// Add a photo to the user's liked photo
    ///
    /// - Parameter photo: Photo to add to the gallery
    func addPhotoToLiked(_ photo:Photo){
        userModel.PhotoLiked.append(photo)
    }
    
    /// Return photos from the liked in a different array, containing the
    /// N photos startin to the index from until the index to
    /// NB it throw an exception if parameter are incorrect
    ///
    /// - Parameters:
    ///   - from: Index of start, must be greater or equal to zero
    ///   - to: Index of end, must be greater and start
    /// - Returns: return the photos from FROM to TO in the liked, if the TO
    ///     is bigger than the gallery size it return
    func getPhotosFromLiked(from:Int, to:Int) -> Array<PhotoViewModel>{
        var max = to
        if to>userModel.PhotoLiked.count{
            max = userModel.PhotoLiked.count
        }
        
        if from>to || from<0{
            return Array<PhotoViewModel>()
        }
        return Array(userModel.PhotoLiked[from..<max].map(({
            (photo: Photo) -> PhotoViewModel in
            return PhotoViewModel(model: photo)
        })))
    }
    
    /// User PhotoLiked count
    ///
    /// - Returns: User's gallery photo count
    func getLikedCount() -> Int{
        return userModel.PhotoLiked.count
    }
}
