//
//  StarbucksCCHTests.swift
//  StarbucksCCHTests
//
//  Created by Silvio Bulla on 25/06/2019.
//  Copyright © 2019 Silvio Bulla. All rights reserved.
//

import XCTest
@testable import StarbucksCCH

class StarbucksCCHTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    //MARK:- Test API url.
    func testAPIConcatenate(){
        let baseUrl = Config.baseUrl
        let city = "bonn"
        let endpoint = ApiAddesses.placeSearchUrl + "starbucks+\(city)" + ApiAddesses.sensorKey + ApiAddesses.key
        
        let fullPath = Utility.apiURL(base: baseUrl, endPoint: endpoint)
        XCTAssertEqual(fullPath, "https://maps.googleapis.com/maps/api/place/textsearch/json?query=starbucks+bonn&sensor=false&key=AIzaSyCmhk7MY_Bh4t_Bd-G03FYW6qOEeQlfTfc")
    }

}
