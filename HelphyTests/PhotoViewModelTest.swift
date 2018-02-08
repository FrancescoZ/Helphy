//
//  PhotoViewModelTest.swift
//  Helphy
//
//  Created by Francesco Zanoli on 09/07/2017.
//  Copyright © 2017 Francesco Zanoli. All rights reserved.
//

import XCTest

class PhotoViewModelTest: XCTestCase {
    
    var mountainViewModel:PhotoViewModel!
    
    override func setUp() {
        super.setUp()
        mountainViewModel = PhotoViewModel(model: Photo("1"))
    }
    
    override func tearDown() {
        mountainViewModel=nil
        super.tearDown()
    }
    
    func testPhotoViewModelInit() {
        XCTAssert(mountainViewModel.ID=="1")
        XCTAssert(mountainViewModel.name=="Default")
        XCTAssert(mountainViewModel.location=="/Default.png")
        XCTAssert(mountainViewModel.iso==0)
        XCTAssert(mountainViewModel.aperture==0)
        XCTAssert(mountainViewModel.time==0)
        XCTAssert(mountainViewModel.wb=="")
        XCTAssert(mountainViewModel.like==0)
    }
    
    func testLikePhotoViewModel(){
        for _ in 1...10 {
            mountainViewModel.addLike()
        }
        XCTAssert(mountainViewModel.like==10)
    }
}
