//
//  PhotoTest.swift
//  Helphy
//
//  Created by Francesco Zanoli on 08/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import XCTest

class PhotoTest: XCTestCase {
    
    var mountain:Photo!
    
    override func setUp() {
        super.setUp()
        mountain = Photo(ID:"1",
                         Name:"mnt",
                         Location:"/mnt.png",
                         ISO:100,
                         Aperture:1.8,
                         Time:0.5,
                         WB:"Cloud",
                         Like:10)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mountain=nil
    }
    
    func testPhotoInit() {
        XCTAssert(mountain.ID=="1")
        XCTAssert(mountain.Name=="mnt")
        XCTAssert(mountain.Location=="/mnt.png")
        XCTAssert(mountain.ISO==100)
        XCTAssert(mountain.Aperture==1.8)
        XCTAssert(mountain.Time==0.5)
        XCTAssert(mountain.WB=="Cloud")
        XCTAssert(mountain.Like==10)
    }
    
}
