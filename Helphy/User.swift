//
//  File.swift
//  Helphy
//
//  Created by Francesco Zanoli on 07/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//


/// User of the system, contain the default information, his photo gallery,
/// his personal information about the camera and his cameras
class User{
    
    /// User Identifier
    var ID:String
    /// Name of the user
    var Name:String
    /// Surname of the user
    var Surname:String
    /// username of the user used to register
    var Nickname:String
    /// Email of the user used during the registration
    var Email:String
    /// Small descrition of the user
    var Bio:String
    /// Profile image path of the user
    var ProfileImage:String?
    /// Background image path of the user
    var BackgroundProfileImage:String?
    /// Like received in total
    var receivedLike:Int = 0
    
    /// Gallery of photos
    var Gallery:Array<Photo> = []
    /// Gallery of photos
    var PhotoLiked:Array<Photo> = []
    
    /// Init the user with all the info about it
    ///
    /// - Parameters:
    ///   - Name: Name of the user
    ///   - Surname: Surname of the user
    ///   - Nickname: Nickname of the user, also used as username
    ///   - Email: Email of the user inserted in the registration
    ///   - Bio: Small description of the user, can be empty
    ///   - ProfileImage: Profile image of the user, nil if it's default
    ///   - BackgroundProfileImage: background profile image of the user,
    ///                                nil if it's default
    init(ID:String,Name:String,Surname:String,Nickname:String,Email:String,Bio:String,
         ProfileImage:String?,BackgroundProfileImage:String?,likeReceived:Int){
        self.ID=ID
        self.Name=Name
        self.Surname=Surname
        self.Nickname=Nickname
        self.Email=Email
        self.Bio=Bio
        self.ProfileImage=ProfileImage
        self.BackgroundProfileImage=BackgroundProfileImage
        self.receivedLike=likeReceived
    }

    
    /// Init the user with some of the info about it
    ///
    /// - Parameters:
    ///   - Name: Name of the user
    ///   - Surname: Surname of the user
    ///   - Nickname: Nickname of the user, also used as username
    ///   - Email: Email of the user inserted in the registration
    ///   - Bio: Small description of the user, can be empty
    ///   - ProfileImage: Profile image of the user, nil if it's default
    ///   - BackgroundProfileImage: background profile image of the user, 
    ///                                nil if it's default
    init(ID:String,Name:String,Surname:String,Nickname:String,Email:String,Bio:String,
         ProfileImage:String,BackgroundProfileImage:String){
        self.ID=ID
        self.Name=Name
        self.Surname=Surname
        self.Nickname=Nickname
        self.Email=Email
        self.Bio=Bio
        self.ProfileImage=ProfileImage
        self.BackgroundProfileImage=BackgroundProfileImage
    }

    
    /// Init the user with only the necessary information
    ///
    /// - Parameters:
    ///   - Name: Name of the user
    ///   - Surname: Surname of the user
    ///   - Nickname: Nickname of the user, also used as username
    ///   - Email: Email of the user inserted in the registration
    ///   - Bio: Small description of the user, can be empty
    init(ID:String,Name:String,Surname:String,Nickname:String,Email:String,Bio:String){
        self.ID=ID
        self.Name=Name
        self.Surname=Surname
        self.Nickname=Nickname
        self.Email=Email
        self.Bio=Bio
    }
}
