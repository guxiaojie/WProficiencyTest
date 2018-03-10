//
//  WProficiencyTestTests.swift
//  WProficiencyTestTests
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import XCTest
@testable import WProficiencyTest

class WProficiencyTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTitleExitsFromMockData() {
        let canada: Canada = self.mockData()
        let viewController = ViewController(canada: canada)
        XCTAssertNil(viewController.title);
    }
    
    func testTableExistsWhenNoData() {
        let canada: Canada = self.mockData()
        let viewController = ViewController(canada: canada)
        XCTAssertNotNil(viewController.tableView);
    }
    
    //MARK: Data    
    func mockData() -> Canada{
        let photo = Photo()
        let canada = Canada()
        canada.title = "a"
        canada.rows = [photo]
        return canada
    }
}
