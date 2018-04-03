//
//  PhotoRequestTests.swift
//  WProficiencyTestTests
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import XCTest
@testable import BBQMan

class PhotoRequestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testParseJSON() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "data", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        let canada = PhotoRequest.parseData(data: data!)
        XCTAssertNotNil(canada);
    }

    
}
