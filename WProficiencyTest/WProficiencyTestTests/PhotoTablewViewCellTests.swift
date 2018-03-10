//
//  PhotoTablewViewCellTests.swift
//  WProficiencyTestTests
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import XCTest
@testable import WProficiencyTest

class PhotoTablewViewCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReloadData() {
        let photo = Photo()
        photo.title = nil
        photo.imageHref = nil
        photo.description = nil
        let cell = PhotoTableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.reloadData(photo: photo)
        XCTAssertNoThrow(cell)
    }
    
}
