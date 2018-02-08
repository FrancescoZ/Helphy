//
//  UserViewModelTest.swift
//  Helphy
//
//  Created by Francesco Zanoli on 08/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import XCTest

class UserViewModelTest: XCTestCase {
    
    var fraViewModel:UserViewModel!
    
    override func setUp() {
        super.setUp()
        fraViewModel = UserViewModel(model: User(ID:"1",
                          Name:"Francesco",
                          Surname:"Zanoli",
                          Nickname:"francescozano",
                          Email:"francesco.zanoli@gmail.com",
                          Bio:"Developper and creator of Helphy",
                          ProfileImage:nil,
                          BackgroundProfileImage:nil,
                          likeReceived:20))
    }
    
    override func tearDown() {
        fraViewModel=nil
        super.tearDown()
        
    }
    
    /// Test the User init basic without image and background profile
    func testUserViewModelInit() {
        XCTAssert(fraViewModel.ID=="1")
        XCTAssert(fraViewModel.name=="Francesco")
        XCTAssert(fraViewModel.surname=="Zanoli")
        XCTAssert(fraViewModel.nickname=="francescozano")
        XCTAssert(fraViewModel.email=="francesco.zanoli@gmail.com")
        XCTAssert(fraViewModel.bio=="Developper and creator of Helphy")
        XCTAssert(fraViewModel.profileImage==nil)
        XCTAssert(fraViewModel.backgroundProfileImage==nil)
        XCTAssert(fraViewModel.receivedLike==20)
    }

    
    func testUserViewModelGallery(){
        for i in 1...10 {
            fraViewModel.addPhotoToGallery(Photo(String(i)))
        }
        XCTAssert(fraViewModel.getGalleryCount()==10)
        XCTAssert(fraViewModel.getPhotosFromGallery(from:0,to:6).count==6)
        XCTAssert(fraViewModel.getPhotosFromGallery(from:-1,to:6).count==0)
        XCTAssert(fraViewModel.getPhotosFromGallery(from:3,to:2).count==0)
        XCTAssert(fraViewModel.getPhotosFromGallery(from:0,to:fraViewModel.getGalleryCount()+1).count==fraViewModel.getGalleryCount())
    }
    
    func testUserViewModelLiked(){
        for i in 1...10 {
            fraViewModel.addPhotoToLiked(Photo(String(i)))
        }
        XCTAssert(fraViewModel.getLikedCount()==10)
        XCTAssert(fraViewModel.getPhotosFromLiked(from:0,to:6).count==6)
        XCTAssert(fraViewModel.getPhotosFromLiked(from:-1,to:6).count==0)
        XCTAssert(fraViewModel.getPhotosFromLiked(from:3,to:2).count==0)
        XCTAssert(fraViewModel.getPhotosFromLiked(from:0,to:fraViewModel.getLikedCount()+1).count==fraViewModel.getLikedCount())
    }
    
}
