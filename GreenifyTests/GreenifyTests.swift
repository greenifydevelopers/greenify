//
//  GreenifyTests.swift
//  GreenifyTests
//
//  Created by Mark Khulenberg on 4/16/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import XCTest
@testable import Greenify

class GreenifyTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        var array: [HomeStruct]
        array = loadJson()
        XCTAssert(array.count > 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
