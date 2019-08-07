//
//  DataLayerTests.swift
//  DataLayerTests
//
//  Created by vasanth on 5/8/19.
//  Copyright © 2019 vasanth. All rights reserved.
//

import XCTest
import Domain
@testable import DataLayer

class DataLayerTests: XCTestCase {

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
    
    
    func test_002_checkWheater (){
        
        let expectation = XCTestExpectation(description: "API CALL")
        let city = City(name: "Singapore")
        
        
        APIServiceLayer.request(router: Router.Weather(city: city)) { [weak self] result in
            
            guard let self = self else
                        {
                            expectation.fulfill()
                            return
                        }
                        switch result {
                        case .success(let currentWeather):
                          
                                XCTAssertNotNil(currentWeather.first)
                                if let desc = currentWeather.first?.weatherDesc.first?.value {
                                  XCTAssertEqual(desc, "Partly cloudy")
                                }

            
                            break
            
                        case .failure:
                            print(result)
                            XCTFail("Network Error")
            
                        }
            
                        expectation.fulfill()
                    }
                    wait(for: [expectation], timeout: 10)
        }
        

}
