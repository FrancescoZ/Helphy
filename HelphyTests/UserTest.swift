//
//  UserTest.swift
//  Helphy
//
//  Created by Francesco Zanoli on 08/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import XCTest

class UserTest: XCTestCase {
    
    var francescoZanoli:User!
    var diambraUgolini:User!
    
    override func setUp() {
        super.setUp()
        francescoZanoli = User(ID:"1",
                               Name:"Francesco",
                               Surname:"Zanoli",
                               Nickname:"francescozano",
                               Email:"francesco.zanoli@gmail.com",
                               Bio:"Developper and creator of Helphy")

        diambraUgolini = User(ID:"2",
                              Name:"Diambra",
                              Surname:"Ugolini",
                              Nickname:"diambrugo",
                              Email:"dia.ugolini@gmail.com",
                              Bio:"Supported the developper and creator of Helphy",
                              ProfileImage:"profile1",
                              BackgroundProfileImage:"mountain")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        francescoZanoli=nil
        diambraUgolini=nil
    }
    
    
    /// Test the User init basic without image and background profile
    func testUserBasicInit() {
        XCTAssert(francescoZanoli.ID=="1")
        XCTAssert(francescoZanoli.Name=="Francesco")
        XCTAssert(francescoZanoli.Surname=="Zanoli")
        XCTAssert(francescoZanoli.Nickname=="francescozano")
        XCTAssert(francescoZanoli.Email=="francesco.zanoli@gmail.com")
        XCTAssert(francescoZanoli.Bio=="Developper and creator of Helphy")
        XCTAssert(francescoZanoli.ProfileImage==nil)
        XCTAssert(francescoZanoli.BackgroundProfileImage==nil)
    }
    
    
    /// Test the User init with all the user variable
    func testUserInit(){
        XCTAssert(diambraUgolini.ID=="2")
        XCTAssert(diambraUgolini.Name=="Diambra")
        XCTAssert(diambraUgolini.Surname=="Ugolini")
        XCTAssert(diambraUgolini.Nickname=="diambrugo")
        XCTAssert(diambraUgolini.Email=="dia.ugolini@gmail.com")
        XCTAssert(diambraUgolini.Bio=="Supported the developper and creator of Helphy")
        XCTAssert(diambraUgolini.ProfileImage=="profile1")
        XCTAssert(diambraUgolini.BackgroundProfileImage=="mountain")
    }
    
}
